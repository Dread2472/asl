state("BioshockInfinite")
{
	int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
	bool noLoadingText : "BioshockInfinite.exe", 0x142DD60, 0x33c, 0x90, 0x64, 0x3b0, 0xd4;
	int noLoadingText2 : "BioshockInfinite.exe", 0x142DD60, 0x220, 0x12c, 0x1e8, 0x328, 0xa0;
	bool playerControl : "BioshockInfinite.exe", 0x1423D18, 0x2c;
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
	return current.loadingScreen != 0 || !current.noLoadingText && !current.playerControl || current.noLoadingText2 == 17 && !current.playerControl;
}