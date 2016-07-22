state("ROTTR")
{
    int  ingameCutscene : 0x281D608;
    bool isLoading      : 0xF25FB8;
    bool FMV            : 0x20E42DC;
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