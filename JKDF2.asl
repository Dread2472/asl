state("JK")
{
	int isLoading : "JK.exe", 0x154A68;
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