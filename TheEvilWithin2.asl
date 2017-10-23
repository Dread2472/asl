<<<<<<< HEAD
state("TEW2")
{
    int isLoading       : 0x236B338;
    int LoadingCutscene : 0x38B7170;
    int MenuSave        : 0x1E211F8;
    int LoadingIcon     : 0x01E239F0, 0x530, 0x4d8, 0x8;
}

isLoading
{
    return current.isLoading == 1 || current.LoadingCutscene == 1 || (current.LoadingIcon == 1 && current.MenuSave == 0);
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
=======
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
>>>>>>> 4e319d00bf8ed7805e24f59e4cefb97b2406b347
