state("BioshockInfinite")
{
	int pauseGame     : 0x13D2A58, 0x534, 0x780, 0x730, 0x2f4;
	int loadingScreen : 0x137CF94, 0x3BC, 0x19C;
	int playerControl : 0x1423D18, 0x2c;
	int afterLogo     : 0x135697C;
}

start
{
	return current.afterLogo == 1 && old.afterLogo == 0;
}

isLoading
{
	return current.loadingScreen != 0 || (current.pauseGame == 0 && current.playerControl == 0);
}