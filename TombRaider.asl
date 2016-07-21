state("TombRaider")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    int  ingameCutscene  : 0x117D20C;
    bool isLoading       : 0x1E33250;
}


isLoading
{
    return current.ingameCutscene == 20 || current.isLoading || current.FMV;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}