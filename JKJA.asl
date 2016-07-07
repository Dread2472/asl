state("jasp")
{
	bool isLoaded   : 0x897C9C;
	bool finalSplit : 0x835AB4;
	int  mapNumber  : 0x480CD0;
}

split
{
	return (old.mapNumber != current.mapNumber && current.mapNumber > 2 && old.mapNumber == 0 && current.mapNumber != 24) ||
	       (current.mapNumber == 78 && current.finalSplit);
}

start
{
	return (current.isLoaded && !old.isLoaded) && current.mapNumber == 24;
}

reset
{
    return current.mapNumber == 24 && old.mapNumber != 24;
}

isLoading
{
	return !current.isLoaded;
}

init
{
	timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
