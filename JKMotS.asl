state("JKM")
{
    bool      isLoading  : 0x1C45F0;
    string9   level      : 0x523AC5;
    bool      start      : 0x4D8020;
    byte      reset      : 0x188FDC;
	bool      credits    : 0x1B6554;
}

state("JediKnightM")
{
    bool      isLoading  : 0x1C45F0;
    string9   level      : 0x523AC5;
    bool      start      : 0x4D8020;
    byte      reset      : 0x188FDC;
	bool      credits    : 0x1B6554;
}

start
{
    return (current.level == "RebelBase" || current.level == "rebelbase") && !current.start && old.start;
}

reset
{
    return (current.level == "RebelBase" || current.level == "rebelbase") && current.reset != 0;
}

split
{
    return current.level != old.level || current.credits;
}

isLoading
{
    return current.isLoading;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}