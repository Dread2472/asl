state("ROTTR")
{
    bool ingameCutscene : 0x27D5EBC;
    bool isLoading      : 0xEF49E0;
}


isLoading
{
    return current.ingameCutscene || current.isLoading;
}