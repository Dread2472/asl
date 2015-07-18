state("jk2sp")
{
	int isLoading : "jk2sp.exe", 0x41D45C;
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