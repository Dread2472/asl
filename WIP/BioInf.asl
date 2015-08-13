state("BioshockInfinite")
{
	int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
	bool playerControl : "BioshockInfinite.exe", 0x1423D18, 0x2c;
	bool pauseGame : "BioshockInfinite.exe", 0x13D2A58, 0x534, 0x780, ox730, 0x2f4;
}

start
{
}

reset
{
}

split
{
}

isLoading
{
	return current.loadingScreen != 0 || !current.pauseGame && !current.playerControl;
}