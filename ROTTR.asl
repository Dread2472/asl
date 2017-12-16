state("ROTTR")
{
    int  ingameCutscene : 0x1A22014;
    bool isLoading      : 0xF25FB8;
    bool FMV            : 0xF9A990;
}


isLoading
{
    return current.ingameCutscene != 0 || current.isLoading || current.FMV;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}