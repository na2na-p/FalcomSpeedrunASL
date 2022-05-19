state("ys6_win_dx9")
{
	byte roomID : 0x002F288, 0x0;
	float BossHP : 0x002A5D4, 0x30;
	float BossHPV : 0x002A5D4, 0x34;
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
	if(old.BossHP != 1 && current.BossHP == 1 && current.roomID == 21)
	{
		return true;
	}

	if(old.BossHP != 0 && current.BossHP == 0 && (current.roomID == 19 || current.roomID == 6 || current.roomID == 4 || current.roomID == 20))
	{
		return true;
	}

	if(old.roomID == 0 && current.roomID == 28)
	{
		return true;
	}
}