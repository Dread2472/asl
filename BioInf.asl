state("BioshockInfinite")
{
	int loadingScreen : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
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
	return current.loadingScreen != 0;
}