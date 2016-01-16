state("Smersh")
{
    bool isLoading : "vfs20.dll", 0x279a8, 0x8, 0x4;
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