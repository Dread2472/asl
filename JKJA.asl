state("jasp")
{
    bool isLoaded : "jasp.exe", 0x897C9C;
    bool finalSplit : "jasp.exe", 0x835AB4;
    int mapNumber : "jasp.exe", 0x480CD0;
}

start
{
}

reset
{
}

split
{
    return (old.mapNumber != current.mapNumber && current.mapNumber > 2 && old.mapNumber == 0) || (current.mapNumber == 78 && current.finalSplit);
}

isLoading
{
    return !current.isLoaded;
}

init
{
    timer.IsGameTimePaused = false;
    game.Exited += (s, e) => timer.IsGameTimePaused = true;
}
