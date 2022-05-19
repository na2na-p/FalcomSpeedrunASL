state("ysf_win_dx9")
{
	byte roomID : 0x002358C, 0x0;
	float BossHP : 0x005F07C, 0x0;
	byte level : 0x0036FBC, 0x0;
	byte dashflag : 0x0037130, 0x44
}


start
{
    if(old.roomID == 1 && current.roomID == 0)
{
return true;
}
}

split
{
	if(old.BossHP != 1 && current.BossHP == 1 && (current.roomID == 69 || current.roomID == 108 || current.roomID == 206 || current.roomID == 213))
	{
		return true;
	}

	if(old.BossHP != 0 && current.BossHP == 0 && (current.roomID == 67 || current.roomID == 128 || current.roomID == 130 || current.roomID == 83 || current.roomID == 142 || current.roomID == 159 || current.roomID == 174 || current.roomID == 188 || current.roomID ==196))
	{
		return true;
	}

	if(old.roomID == 226 && current.roomID == 227)
	{
		return true;
	}

	if(old.BossHP != 0 && current.BossHP == 0 && current.roomID == 229)
	{
		return true;
	}

if(old.roomID == 34 && current.roomID == 36 && current.level > 30 && current.dashflag == 0)
{
	return true;
}
}