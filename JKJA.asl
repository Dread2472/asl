state("jasp")
{
    bool isLoaded   : 0x897C9C;
    bool finalSplit : 0x835AB4;
    int  mapNumber  : 0x480CD0;
    bool ILSplit    : 0x43AFFC;
    bool isCutsceneSkipped : 0x493390;
}

startup
{
    settings.Add("ILT", false, "IL Timer");
    settings.Add("dumbstart", false, "Start time on end of loadscreen");
}

split
{
    return (old.mapNumber != current.mapNumber) && ((current.mapNumber > 2 && old.mapNumber == 0 && current.mapNumber != 24) || settings["ILT"]) 
           || (current.mapNumber == 78 && current.finalSplit) || (settings["ILT"] && current.ILSplit);
}

start
{
    return ((current.isLoaded && !old.isLoaded) && (current.mapNumber == 24 || settings["dumbstart"]));
}

reset
{
    return current.mapNumber == 24 && old.mapNumber != 24;
}

isLoading
{
    return !current.isLoaded || (current.isCutsceneSkipped && settings["ILT"]);
}

init
{
    timer.IsGameTimePaused = false;
    game.Exited += (s, e) => timer.IsGameTimePaused = true;
}
