state("jk2sp")
{
	int isLoading : 0x41D45C;
	int Loading2  : 0xEF5200;
}

isLoading
{
	return current.isLoading == 0 || current.isLoading == 1 && current.Loading2 == 0;
}