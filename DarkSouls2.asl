state("DarkSoulsII")
{
	bool isLoaded : "DarkSoulsII.exe", 0x0114A58C, 0x300, 0x65c, 0x64, 0x9c;
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
	return !current.isLoaded;
}