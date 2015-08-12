state("DarkSoulsII")
{
	bool isLoaded : "DarkSoulsII.exe", 0x0114A58C, 0x300, 0x65c, 0x64, 0x9c;
	int menuLoads : "DarkSoulsII.exe", 0x2B3B54, 0x1b0, 0x2e8, 0x7c, 0x10, 0x7b8;
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
	return !current.isLoaded || current.menuLoads != 0;
}