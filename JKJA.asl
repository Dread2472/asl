state("jasp")
{
    bool isLoaded : "jasp.exe", 0x897C9C;
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
