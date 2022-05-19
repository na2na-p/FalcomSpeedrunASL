state("ysf_win_dx9")
{
float bossHP : 0x1ABAD4;
byte room : 0x01E9044, 0x40;
byte level : 0x01C25A0, 0x0, 0x108;
byte room2 : 0x01E9044, 0x11C;
byte room3 : 0x01E9044, 0x13C;
byte hitrate : 0x012F2A4, 0xC9C;
float adol_hp : 0x01C25A0, 0x0, 0xD8;
}



split
{
if(old.bossHP != 1 && current.bossHP == 1 && (current.room == 55 || current.room == 102 || current.room == 136 || current.room == 204 || current.room == 214))
{
return true;
}

if(old.bossHP != 0 && current.bossHP == 0 && (current.room == 65 || current.room == 123 || current.room == 171 || current.room == 185 || current.room == 193 || current.room == 0))
{
return true;
}

if(old.room == 128 && current.room == 0)
{
return true;
}

if(old.bossHP > 0 && current.bossHP <= 0 && current.room == 81)
{
return true;
}

if(current.level >= 46 && (old.room2 == 48 && current.room2 == 178 || old.room3 == 227 && current.room3 == 0))
{
return true;
}
}

reset
{
    //if(old.adol_hp != 0 && current.adol_hp == 0){
    //    return true;
    //}
}