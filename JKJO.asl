state("jk2sp")
{
	int isLoading : 0x41D45C;
}

isLoading
{
	return current.isLoading == 0;
}