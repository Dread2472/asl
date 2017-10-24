state("TEW2")
{
    int isLoading       : 0x236B338;
    int LoadingCutscene : 0x38B7170;
    int MenuSave        : 0x1E211F8;
    int LoadingIcon     : 0x01E239F0, 0x530, 0x4d8, 0x8;
    int Chapter         : 0x3615208, 0x5c;
    short x             : 0x38CD190;
    short y             : 0x38CD194;
}

reset
{
    return current.Chapter == 1 && old.Chapter == 0;
}

start
{
    return current.Chapter == 1 && old.Chapter == 1;
}

split
{
    return (current.Chapter > old.Chapter && current.Chapter < 18 && current.Chapter > 1 && old.Chapter != 0) ||
           (current.x == 39941 && old.x != 39941 && current.y == 25273 && old.y != 25273 && current.Chapter == 17);
}

isLoading
{
    return current.isLoading == 1 || current.LoadingCutscene == 1 || (current.LoadingIcon == 1 && current.MenuSave == 0) || current.Chapter == 0 || current.Chapter > 17;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
