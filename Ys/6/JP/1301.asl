state("ys6_win")
{
	// NOTE: The ID system is slightly different from other versions.
	byte roomID : 0x0171B24, 0x40;
	float BossHP : 0x0044338, 0x30;
	float BossMaxHP : 0x0044338, 0x38;
}

onStart{
	vars.isKishgalEntered = false;
	vars.isErnstPassed = false;
}

// start
// {
// }

split
{
	// Geis
	// if (old.BossHP != 1 && current.BossHP == 1 && current.roomID == 84) {
	// 	return true;
	// }

	if (old.BossHP != 0 && current.BossHP == 0 && (current.roomID == 28 || current.roomID == 157 || current.roomID == 75 || current.roomID == 97 || current.roomID == 186 || current.roomID == 196)) {
		return true;
	}

	// Napishtim(Last)
	if (old.BossHP != 0 && current.BossHP == 0 && current.roomID == 0 && current.BossMaxHP == 5000) {
		return true;
	}

	// Kishgal IN
	if (vars.isKishgalEntered == false && (old.roomID == 27 && current.roomID == 35 || old.roomID == 27 && current.roomID == 0 || old.roomID == 0 && current.roomID == 35)) {
		vars.isKishgalEntered = true;
		return true;
	}

	// Ernst
	if (vars.isErnstPassed == false && (old.roomID == 201 && current.roomID == 203 || old.roomID == 0 && current.roomID == 203)) {
		vars.isErnstPassed = true;
		return true;
	}
}