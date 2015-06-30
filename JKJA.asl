state("jasp")
{
    bool isLoaded : "jasp.exe", 0x43FCEC;
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