state("yso_win"){
	byte roomID : 0x001CBE4, 0x0; //ok
	byte boostflag : 0x002B9AC, 0x0; //ok
	byte dbjumpflag : 0x004F8AC, 0x0; //ok
	float SBHP99999 : 0x02B99DC, 0x4, 0x880; //ok
	float VelagunderHP : 0x02B9A68, 0x20, 0x98; //ok
	byte NumofDulessHP : 0x001B648, 0x0; //ok
	float SPBossHP : 0x02B99D8, 0x4, 0x98; //ok
	float FloorBossHP : 0x00B3720, 0x0; //ok
	float velg_mouth : 0x025CCDC, 0xC, 0x488, 0xCC;
}


start{
    if(old.roomID == 19 && current.roomID == 173){ //Bonus SP Select
		return true;
	}
}

split{
	//if(old.boostflag == 0 && current.boostflag == 1 && current.roomID == 33){ //Get Boost
	//	return true;
	//}
	if(old.roomID == 40 && current.roomID == 37){ //Yunica Skip success
		return true;
	}
	if(old.VelagunderHP > 0 && current.VelagunderHP <= 0 && current.roomID == 45){ //Velagunder
		return true;
	}
	if(old.SPBossHP > 1 && current.SPBossHP <= 1 && (current.roomID == 67 || current.roomID == 168)){ //Hugo1
		return true;
	}
	if(old.FloorBossHP > 0 && current.FloorBossHP <= 0 && (current.roomID == 69 || current.roomID == 93 || current.roomID == 166 || current.roomID == 176)){ //Nygtilger & Gelaldy & Zava & Darm
		return true;
	}
	if(old.SBHP99999 > 0 && current.SBHP99999 <= 0 && (current.roomID == 91 || current.roomID == 165)){ //Shion & Kishgal
		return true;
	}
	if(old.roomID == 123 && current.roomID == 122){ //Khonsclard
		return true;
	}
	if(old.roomID == 147 && current.roomID == 146){ //Pictimos
		return true;
	}
	if(old.FloorBossHP > 0 && current.FloorBossHP == 0 && current.roomID == 175 && current.NumofDulessHP == 2){ //Dalles
		return true;
	}
}