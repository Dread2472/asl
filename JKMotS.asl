state("JK")
{
	bool      isLoading  : 0x1A3200;
    string9   level      : 0x523AC5;
}

start
{
    return current.level == "RebelBase" && old.isLoading && !current.isLoading;
}

split
{
    return current.level != old.level;
}

isLoading
{
	return current.isLoading;
}
