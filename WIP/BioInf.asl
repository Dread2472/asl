state("BioshockInfinite")
{
	int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
	int playerControl : "BioshockInfinite.exe", 0x1423D18, 0x2c;
	int pauseGame : "BioshockInfinite.exe", 0x13D2A58, 0x534, 0x780, 0x730, 0x2f4;
}

start
{
	return current.loadingScreen == 0 && old.loadingScreen == 15;
}

reset
{
}

split
{
	current.split1 = 0;
	current.split2 = 0;
	current.split3 = 0;
	current.split4 = 0;
	current.split5 = 0;
	if (current.loadingScreen == 25 && old.loadingScreen == 0) {       /* Comstock Center Rooftops */
		current.split1++;
	}

	
	if ((current.split1 == 1 && old.split1 == 0) ||
	    (current.split2 == 1 && old.split2 == 0) ||
	    (current.split3 == 1 && old.split3 == 0) ||
	    (current.split4 == 1 && old.split4 == 0) ||
	    (current.split5 == 1 && old.split5 == 0)) {
		return true;
	}
}

isLoading
{
	return current.loadingScreen != 0 || (current.pauseGame == 0 && current.playerControl == 0);
}