state("JK")
{
	int isLoading : "JK.exe", 0x154A78;
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