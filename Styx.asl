state("StyxGame")
{
    bool isLoading : "StyxGame.exe", 0x2AA9D2C;
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
    return current.isLoading;
}