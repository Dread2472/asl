state("Rune")
{
	int isLoading : "Core.dll", 0x197B50;
}

isLoading
{
	return current.isLoading != 0;
}