state("ROTTR")
{
    int  ingameCutscene : 0x167C222;
    bool isLoading      : 0xF644A0;
    bool FMV            : 0x294D0B4;
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
