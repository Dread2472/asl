state("BioshockInfinite")
{
    int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
    int playerControl : "BioshockInfinite.exe", 0x1423D18, 0x2c;
    int pauseGame : "BioshockInfinite.exe", 0x13D2A58, 0x534, 0x780, 0x730, 0x2f4;
    int afterLogo : "BioshockInfinite.exe", 0x135697C;
}
 
start
{
    if (current.afterLogo == 1 && old.afterLogo == 0) {
        current.split1 = false;
		current.split2 = false;
        return true;
    }
}
 
split
{
    if (!current.split1 && current.loadingScreen == 25 && old.loadingScreen == 0) {
        // Comstock Center Rooftops
        current.split1 = true;
        return true;
    }
	if (!current.split2 && current.loadingScreen == 24 && old.loadingScreen == 0) {
        // Monument Island Gateway
        current.split1 = true;
        return true;
    }
	if (!current.split2 && current.loadingScreen == 15 && old.loadingScreen == 0) {
        // Monument Tower
        current.split1 = true;
        return true;
    }
}
 
isLoading
{
    return current.loadingScreen != 0 || (current.pauseGame == 0 && current.playerControl == 0);
}