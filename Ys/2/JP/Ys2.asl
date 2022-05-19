state("ys2c")
{
	byte roomID_F : 0x0026288, 0x0;
	float EnemyHP : 0x0006788, 0x14;
	byte vhadal : 0x0084E9C, 0x3C;
	byte firemagic : 0x0084E9C, 0x24;
	byte roomID_H : 0x003EBF0, 0x0;
	byte lava_bridge : 0x009EB14, 0xA0;
	byte cur_in_tov : 0x009EB14, 0xD0;
}

start
{
    if(old.roomID_H == 199 && current.roomID_H == 200)
	{
	return true;
	}
}

split
{
	if(old.EnemyHP > 0 && current.EnemyHP <= 0 && (current.roomID_F == 65 || current.roomID_F == 74 || current.roomID_F == 103 || current.roomID_F == 122 || current.roomID_F == 175 || current.roomID_F == 188 || current.roomID_F == 197))
	{
	return true;
	}
	if(old.vhadal == 1 && current.vhadal == 0)
	{
	return true;
	}
		if(old.firemagic == 0 && current.firemagic == 1)
	{
	return true;
	}
}