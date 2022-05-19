state("yso_win")
{
	byte roomID : 0x0011DF4, 0x0;
	float FloorBossHP : 0x0094FE8, 0x0;
	byte FireSkill : 0x0035250, 0x64;
	byte NumofDulessHP : 0x00DF78C, 0x0;
	byte weaponLv : 0x00146E4, 0x8;
	byte kishgal : 0x00DF39C, 0xF18;
	byte Epona : 0x00DF39C, 0xF00;
}


start
{
    if(old.roomID == 19 && current.roomID == 21)
{
return true;
}
}

split
{
	if(old.weaponLv == 0 && current.weaponLv == 1 && current.roomID == 41)
	{
		return true;
	}

	if(old.roomID == 43 && current.roomID == 28)
{
return true;
}
	if(old.roomID == 45 && current.roomID == 44)
{
return true;
}
	if(old.roomID == 67 && current.roomID == 54)
{
return true;
}
	if(old.roomID == 69 && current.roomID == 68)
{
return true;
}
	if(old.FireSkill != 1 && current.FireSkill == 1 && current.roomID == 79)
{
return true;
}
	if(old.roomID == 93 && current.roomID == 92)
{
return true;
}

	if(old.Epona == 0 && current.Epona == 1 && current.roomID == 165)
{
return true;
}

	if(old.roomID == 123 && current.roomID == 122)
{
return true;
}

	if(old.roomID == 147 && current.roomID == 146)
{
return true;
}

	if(old.roomID == 166 && current.roomID == 161)
{
return true;
}

	if(old.kishgal == 0 && current.kishgal == 1 && current.roomID ==168)
{
return true;
}

	if(old.FloorBossHP > 0 && current.FloorBossHP <= 0  && current.roomID == 175 && current.NumofDulessHP == 2)
{
return true;
}
}