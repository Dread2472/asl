state("TEW2")
{
    int isLoading       : 0x236B338;
    int LoadingCutscene : 0x38B7170;
    /* int MenuSave        : 0x1E211F8;
       int LoadingIcon     : 0x01E239F0, 0x530, 0x4d8, 0x8; */
    int Chapter         : 0x3615208, 0x5c;
    int Pause           : 0x3637B00;
    short x             : 0x38CD190;
    short y             : 0x38CD194;
    float z             : 0x38CD198;
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
    return (current.Chapter > old.Chapter && old.Chapter < 17 && old.Chapter > 0) ||
           (current.x == 39941 && current.y == 25273 && current.Chapter == 17);
}

isLoading
{
    return current.isLoading == 1 ||
           current.Pause == 1 ||
           current.LoadingCutscene == 1 ||
           current.Chapter < 1 ||
           current.Chapter > 17 ||
           (current.z < -4300.0 && current.z > -4400.0 && current.Chapter != 1)
           ;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
