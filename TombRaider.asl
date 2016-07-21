state("TombRaider")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    byte ingameCutscene  : 0x1FD1840;
    bool isLoading       : 0x1E33250;
}


isLoading
{
    return current.ingameCutscene != 61 || current.isLoading || current.FMV;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}