state("yso_win")
{
	byte roomID : 0x00121F4, 0x0;
	float VelagunderHP : 0x025B460, 0x20, 0x98;
	float SPBossHP : 0x025B3CC, 0x4, 0x98;
	float FloorBossHP : 0x00973F8, 0x0;
	byte FireSkill : 0x0036BA0, 0x64;
	byte DBoneKey : 0x0013500, 0x1F4;
	float SBHP99999 : 0x025B3D0, 0x4, 0x880;
	byte NumofDulessHP : 0x00E376C, 0x0;
	byte boostflag : 0x001EB6C, 0x0;
	byte dbjumpflag : 0x003CB04, 0x0;
}


start
{
    if(old.roomID == 19 && current.roomID == 173)
	{
	return true;
	}
}

split
{
	if(old.boostflag == 0 && current.boostflag == 1 && current.roomID == 33)
	{
	return true;
	}

	if(old.VelagunderHP > 0 && current.VelagunderHP <= 0 && current.roomID == 45)
	{
	return true;
	}

	if(old.SPBossHP > 1 && current.SPBossHP <= 1 && current.roomID == 67)
	{
	return true;
	}

	if(old.SPBossHP > 0 && current.SPBossHP <= 0 && (current.roomID == 112 || current.roomID == 168))
	{
	return true;
	}

	if(old.FloorBossHP > 0 && current.FloorBossHP <= 0 && (current.roomID == 69 || current.roomID == 93))
	{
	return true;
	}

	if(old.FireSkill != 1 && current.FireSkill == 1 && current.roomID == 79)
	{
	return true;
	}

	if(old.dbjumpflag == 0 && current.dbjumpflag == 1 && current.roomID == 101)
	{
	return true;
	}

	if(old.roomID == 123 && current.roomID == 122)
	{
	return true;
	}

	if(old.DBoneKey != 1 && current.DBoneKey == 1 && current.roomID == 145)
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

	if(old.SBHP99999 > 0 && current.SBHP99999 < 0 && current.roomID ==165)
	{
	return true;
	}

	if(old.FloorBossHP > 0 && current.FloorBossHP == 0 && current.roomID == 175 && current.NumofDulessHP == 2)
	{
	return true;
	}

	if(old.FloorBossHP > 0 && current.FloorBossHP == 0 && current.roomID == 176)
	{
		return true;
	}
}