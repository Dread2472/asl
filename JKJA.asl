state("jasp")
{
	bool isLoaded   : 0x897C9C;
	bool finalSplit : 0x835AB4;
	int  mapNumber  : 0x480CD0;
}

split
{
	return (old.mapNumber != current.mapNumber && current.mapNumber > 2 && old.mapNumber == 0) ||
	       (current.mapNumber == 78 && current.finalSplit);
}

isLoading
{
	return !current.isLoaded;
}

init
{
	timer.IsGameTimePaused = false;
	game.Exited += (s, e) => timer.IsGameTimePaused = true;
}
