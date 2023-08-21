state("TombRaider", "[Steam] 0.0")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    int  ingameCutscene  : 0x20C97C0;
    bool isLoading       : 0x1CF7FE0;
}

state("TombRaider", "[Epic Games] 0.0")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    int  ingameCutscene  : 0x20C7DBC;
    bool isLoading       : 0x1CF6960;
}

state("TombRaider", "[Steam] 743.0")
{
    bool FMV             : "binkw32.dll", 0x2830C;
    int  ingameCutscene  : 0x211AB5C;
    bool isLoading       : 0x1E33250;
}


isLoading
{
    return current.ingameCutscene == 520 || current.isLoading || current.FMV;
}

init
{
    switch(modules.FirstOrDefault(r => r.ModuleName == "TombRaider.exe").ModuleMemorySize)
    {
        case 38543360:
            version = "[Steam] 0.0";
            break;
        case 38535168:
            version = "[Epic Games] 838.0";
            break;
        case 38739968:
            version = "[Steam] 743.0";
            break;
    };

    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}