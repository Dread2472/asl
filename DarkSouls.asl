state("DARKSOULS")
{
	bool isLoading : "DARKSOULS.exe", 0xF7B1E0, 0x318, 0x3c, 0x514, 0x154;
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
	return current.isLoading;
}