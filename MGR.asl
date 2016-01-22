state("METAL GEAR RISING REVENGEANCE")
{
	bool playerControl : 0x148DD2C;
	bool isLoading     : 0x14B9200;
}

isLoading
{
	return current.isLoading && !current.playerControl;
}

init
{
	timer.IsGameTimePaused = false;
	game.Exited += (s, e) => timer.IsGameTimePaused = true;
}
