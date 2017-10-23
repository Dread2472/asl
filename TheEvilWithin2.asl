state("TEW2")
{
	int isLoading  : 0x236B338;
}

start
{

}

isLoading
{
	return current.isLoading == 1;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
