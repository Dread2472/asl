state("jasp")
{
    bool isLoaded : "jasp.exe", 0x43FD44;
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
    return !current.isLoaded;
}