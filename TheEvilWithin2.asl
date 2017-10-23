state("TEW2")
{
    int isLoading       : 0x236B338;
    int LoadingCutscene : 0x38B7170;
    int LoadingIcon     : 0x01E239F0, 0x530, 0x4d8, 0x8;
}

isLoading
{
    return current.isLoading == 1 || current.LoadingCutscene == 1 || current.LoadingIcon == 1;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
