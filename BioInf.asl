state("BioshockInfinite")
{
	int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
	int loadingText : "BioshockInfinite.exe", 0x142DD60, 0x33c, 0x1e8, 0x328, 0xa0;
	int playerControl : "BioshockInfinite.exe", 0x1416460;
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
	return current.loadingScreen != 0 || current.loadingText == 17 && current.playerControl == 0;
}