state("JK")
{
    bool      isLoading  : 0x154A68;
    string11  level      : 0x43599C;
}

state("JediKnight")
{
    bool      isLoading  : 0x154A68;
    string11  level      : 0x43599C;
}

start
{
    return current.level == "01narshadda" && old.isLoading && !current.isLoading;
}

split
{
    return current.level != old.level && current.level != "01narshadda";
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
