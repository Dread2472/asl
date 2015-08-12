state("DARKSOULS")
{
	bool isLoading : "DARKSOULS.exe", 0xF7E1E0, 0x2c0, 0xd8, 0x154;
	int gameTime : "DARKSOULS.exe", 0xA2A800, 0x638, 0xx, 0x0, 0x6fc;
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

gameTime
{
	TimeSpan.FromTicks(gameTime);
}