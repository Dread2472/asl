state("TombRaider")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    int  ingameCutscene  : 0x211AB5C;
    bool isLoading       : 0x1E33250;
}


isLoading
{
    return current.ingameCutscene == 520 || current.isLoading || current.FMV;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}