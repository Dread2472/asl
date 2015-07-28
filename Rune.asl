state("Rune")
{
	int isLoading : "Core.dll", 0x197B50;
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
	return current.isLoading != 0;
}