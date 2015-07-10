state("BioshockInfinite")
{
	int isLoaded : "BioshockInfinite.exe", 0x137CF94, 0x3BC, 0x19C;
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
	return current.isLoaded != 0;
}