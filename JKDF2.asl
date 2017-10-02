state("JK")
{
    bool      isLoading  : 0x154A68;
    string11  level      : 0x43599C;
    bool      credits    : 0x15AD94;
    byte      pos1       : 0x4EC558;
    byte      pos2       : 0x4EC55C;
    bool      menu       : 0x156020;
}

state("JediKnight")
{
    bool      isLoading  : 0x154A68;
    string11  level      : 0x43599C;
    bool      credits    : 0x15AD94;
    byte      pos1       : 0x4EC558;
    byte      pos2       : 0x4EC55C;
    bool      menu       : 0x156020;
}

start
{
    return current.level == "01narshadda" && current.pos1 == 77 && current.pos2 == 33 && !current.menu;
}

reset
{
    return current.level == "01narshadda" && current.pos1 == 77 && current.pos2 == 33 && (old.pos1 != 77 || old.pos2 != 33);
}
split
{
    return current.level != old.level && current.level != "01narshadda" || current.credits;
}

isLoading
{
    return current.isLoading;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
