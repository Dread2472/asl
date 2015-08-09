state("DARKSOULS")
{
	bool isLoading : "DARKSOULS.exe", 0xF7E1E0, 0x2c0, 0xd8, 0x154;
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