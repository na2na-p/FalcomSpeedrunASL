state("yso_win"){
	byte roomID : 0x00121F4, 0x0;
	float SBHP99999 : 0x025B3D0, 0x4, 0x880;
	float VelagunderHP : 0x025B460, 0x20, 0x98;
	byte NumofDulessHP : 0x00E376C, 0x0;
	float SPBossHP : 0x025B3CC, 0x4, 0x98;
	float FloorBossHP : 0x00973F8, 0x0;
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