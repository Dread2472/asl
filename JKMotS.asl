state("JKM")
{
    bool      isLoading  : 0x1A3200;
    string9   level      : 0x523AC5;
    bool      start      : 0x4D8020;
    byte      reset      : 0x188FDC;
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
    return current.level != old.level;
}

isLoading
{
    return current.isLoading;
}
