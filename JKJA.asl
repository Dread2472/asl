state("jasp")
{
    bool isLoaded : "jasp.exe", 0x897B64;
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