state("re5dx9")
{
	int isLoaded : "re5dx9.exe", 0x00DA1714, 0x314;
	int levelNumber : "re5dx9.exe", 0x00DA1E38, 0x124;
}

start
{
}

reset
{
}

split
{
	return current.levelNumber > old.levelNumber;
}

isLoading
{
	return current.isLoaded == 0;
}