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
	byte silvdress : 0x0013500, 0x220;
	byte scstatus : 0x001C8BC, 0x0;
	float boost : 0x001CAD0, 0x0;
	byte uistatus : 0x0014638, 0x0;
	byte statewp : 0x0014574, 0x0;
}


start
{
	if(old.boost > 0 && current.boost == 0)
{
return true;
}
}

split
{
	if(old.boost != 30000 && current.boost == 30000)
{
return true;
}
}