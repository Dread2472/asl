state("METAL GEAR RISING REVENGEANCE")
{
    bool playerControl : "METAL GEAR RISING REVENGEANCE.exe", 0x148DD2C;
    bool isLoading : "METAL GEAR RISING REVENGEANCE.exe", 0x14B9200;
}

start
{
}

reset
{
}

split
{
}

isLoading
{
    return current.isLoading && !current.playerControl;
}

init
{
    timer.IsGameTimePaused = false;
    game.Exited += (s, e) => timer.IsGameTimePaused = true;
}
