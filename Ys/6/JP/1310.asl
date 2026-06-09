// =====================================================================
//  Ys VI (YS6_WIN.exe) Auto Splitter  -- ルート版（素のエッジ条件方式）
//  フラグ管理なし。各条件は「変化した瞬間」だけ成立するので自然に1回発火。
//   ボス撃破 = BossHP 非0→0 / しきい値 = 跨いだ瞬間 / 遷移 = prev→new の瞬間
//
//  P = [mod+0x177a44] + [mod+0x177a48]
//  RoomID=[P+0x118] Lv=[P+0x27c] sword0/1/2=[P+0x21c/0x22c/0x23c]
//  Emel=[P+0x45c] Armor=[P+0x2e8]!=-1 Shield=[P+0x2d0]!=-1
//  BossHP/BossMaxHP = 0x53A648 / 0x53A650
//  ※ロード中 RoomID は -1(未ロード)/0(無マップ中継)。prev 判定では無視。
// =====================================================================

state("YS6_WIN")
{
    float BossHP    : 0x13A648;
    float BossMaxHP : 0x13A650;
}

startup
{
    vars.lastRoom    = -1;
vars.fromRoom = -1;
vars.roomChanged = false;
vars.udFired = false;   // Ud-Meiyu(room80) 撃破済みフラグ（部屋変更で解除）
}

init
{
    vars.modBase     = modules.First().BaseAddress;
vars.lastRoom = -1;
vars.fromRoom = -1;
vars.roomChanged = false;
vars.udFired = false;
}

update
{
    long b = ((IntPtr)vars.modBase).ToInt64();
int lo = game.ReadValue<int>((IntPtr)(b + 0x177a44));
int sel = game.ReadValue<int>((IntPtr)(b + 0x177a48));

// 新規ゲームメニュー状態（固定グローバル。Pに依存せず常時読める）
current.menu0 = (int)game.ReadValue<byte>((IntPtr)(b + 0x171c4d)); // 0x571c4d
current.menu1 = (int)game.ReadValue<byte>((IntPtr)(b + 0x171c4e)); // 0x571c4e

current.loaded = (lo != 0);
if (current.loaded)
{
    long P = (uint)lo + (uint)sel;
    current.roomID = game.ReadValue<int>((IntPtr)(P + 0x118));
    current.level = game.ReadValue<int>((IntPtr)(P + 0x27c));
    current.sword0 = game.ReadValue<int>((IntPtr)(P + 0x21c));
    current.sword1 = game.ReadValue<int>((IntPtr)(P + 0x22c));
    current.emel = game.ReadValue<int>((IntPtr)(P + 0x45c));
    current.armor = game.ReadValue<int>((IntPtr)(P + 0x2e8)) != -1;
    current.shield = game.ReadValue<int>((IntPtr)(P + 0x2d0)) != -1;
    current.mode = game.ReadValue<int>((IntPtr)(P + 0x4d8)); // 0=Story, 1=Time Attack
    current.exp = game.ReadValue<float>((IntPtr)(P + 0x264));
}
else
{
    current.roomID = -1;
    current.level = -1; current.sword0 = -1; current.sword1 = -1;
    current.emel = -1; current.armor = false; current.shield = false;
    current.mode = -1; current.exp = -1f;
}

// 部屋遷移検出。-1(未ロード)/0(無マップ中継) は有効部屋とみなさず lastRoom を更新しない。
vars.roomChanged = false;
int rid = (int)current.roomID;
if ((bool)current.loaded && rid != -1 && rid != 0 && rid != (int)vars.lastRoom)
{
    vars.fromRoom = vars.lastRoom;
    vars.lastRoom = rid;
    vars.roomChanged = true;
}

// Ud-Meiyu(room80): 部屋を出たら撃破フラグを再武装（EXP増加で撃破検出するため）
if ((bool)vars.roomChanged) vars.udFired = false;

}

start
{
    // 新規ゲームのみで開始。タイトル(Room=1)→最初の部屋へ遷移した瞬間に：
    //   mode==0      … ストーリー（TimeAttack の mode!=0 を除外）
    //   menu0(0x571c4d)!=0 … 新規ゲームメニュー経由（=1）。「つづきから」は menu0==0 なので除外。
    if ((bool)current.loaded && (int)old.roomID == 1 && (int)current.roomID != 1
        && (int)current.mode == 0 && (int)current.menu0 != 0)
    {
        vars.lastRoom = -1; vars.fromRoom = -1; vars.udFired = false;
return true;
    }
    return false;
}

split
{
    if (!(bool)current.loaded) return false;
if ((int)current.mode != 0) return false;   // Time Attack(mode!=0)中は一切発火しない

// ボス撃破 = BossHP が 非0→0（ボス戦中はメニュー不可=ロード不可なので誤爆しない）。
bool bossDown = (float)old.BossHP != 0f && (float)current.BossHP == 0f;
bool roomChg = (bool)vars.roomChanged;
int prev = (int)vars.fromRoom;
int room = (int)current.roomID;
int lv = (int)current.level;

// --- ボス撃破（BossHP 非0→0）---
if (bossDown && room == 39) return true;                                   // Demi-Galba
if (bossDown && room == 160) return true;                                   // Zonplas
if (room == 80 && !(bool)vars.udFired && (float)old.exp >= 0f && (float)current.exp > (float)old.exp) { vars.udFired = true; return true; } // Ud-Meiyu(撃破でEXP増加)
if (bossDown && room == 98) return true;                                   // Piana-Pius
if (bossDown && room == 189) return true;                                   // Orjugan
if (bossDown && room == 199) return true;                                   // Galba-Roa
if (bossDown && room == 206 && (float)current.BossMaxHP == 5000f) return true; // Napishtim

// --- 部屋遷移（prev→new。ロード中継0は無視済み）---
if (roomChg && prev == 162 && room == 94 && (bool)current.armor && (bool)current.shield && lv <= 10) return true; // LimeCave1
if (roomChg && prev == 78 && room == 193 && lv >= 30) return true;         // Zemeth IN
if (roomChg && prev == 36 && room == 40) return true;                     // Kishgal IN
if (roomChg && prev == 56 && room == 196) return true;                     // Ark IN
if (roomChg && prev == 203 && room == 205) return true;                     // Ernst

// --- しきい値到達（跨いだ瞬間。ロード後の誤爆防止に old!=-1 ＋ 発生する部屋に限定）---
if (room == 116 && (int)old.sword0 != -1 && (int)old.sword0 < 4 && (int)current.sword0 >= 4) return true; // 青Lv4(idx0)
if (room == 116 && (int)old.sword1 != -1 && (int)old.sword1 < 8 && (int)current.sword1 >= 8) return true; // 赤Lv8(idx1)
if (room == 182 && (int)old.emel != -1 && (int)old.emel < 19839 && (int)current.emel >= 19839) return true; // LimeCave Emel

return false;
}
