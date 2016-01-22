state("DARKSOULS")
{
	bool isLoading : 0xF7E1E0, 0x2c0, 0xd8, 0x154;
}

isLoading
{
	return current.isLoading;
}