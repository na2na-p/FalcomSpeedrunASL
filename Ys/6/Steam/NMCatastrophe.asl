state("ys6_win_dx9")
{
	byte roomID : 0x001A02C, 0x0;
	float BossHP : 0x0037F34, 0x2C;
	float MaxBossHP : 0x0037F34, 0x34;
	byte level_Ericcil : 0x002F568, 0x20;
	byte level_Brillante : 0x002F568, 0x10;
	byte level_Livart : 0x002F568, 0x0;
	byte Galba_Shield : 0x00187A4, 0x70;
	byte Galba_Armor : 0x00187A4, 0x84;
}

startup{
	vars.timerModel = new TimerModel {CurrentState = timer};
}

start{
    if(old.roomID == 1 && current.roomID == 0){
		return true;
	}
}

split{
	if(old.BossHP > 0 && current.BossHP == 0 && (current.roomID == 39 || current.roomID == 160 || current.roomID == 80 || current.roomID == 189 || current.roomID == 137 || current.roomID == 183 || current.roomID == 199)){
		return true; //基本的なボスたち。中ボス以外です。
	}
	if((old.roomID == 162 || old.roomID == 175 || old.roomID == 167) && (current.roomID == 94 || current.roomID == 138 || current.roomID == 145) && current.level_Brillante == 1 && current.Galba_Armor == 1 && current.Galba_Shield == 1){
		return true; //赤剣未入手 or 未強化でガルヴァ胴盾所持の上(洞窟入口or中間orガルヴァ鎧)から脱出(平原or山入口or山中腹)
	}
	if(old.BossHP > 0 && current.BossHP <= 0 && current.roomID == 98 && (current.MaxBossHP < 1526 || current.MaxBossHP == 723)){
		return true; //ピアスのみ。HP低い方のやつはNormal用
	}
	if(old.roomID == 203 && current.roomID == 205){
		vars.timerModel.UndoSplit();
		return; //エルンスト。マップ移動
	}
	if(old.BossHP > 0 && current.BossHP == 0 && current.roomID == 206 && (current.MaxBossHP == 7500 || current.MaxBossHP == 5000)){
		return true; //ナピ撃破
	}
	if(old.level_Brillante == 7 && current.level_Brillante == 8){
		return true; //剣1回目 赤
	}
	if(old.level_Ericcil == 4 && current.level_Ericcil == 5){
		return true; //剣2回目 金
	}
	if(old.level_Livart == 9 && current.level_Livart == 10){
		return true; //剣3回目 青
	}
}