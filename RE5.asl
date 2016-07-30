state("re5dx9")
{
	int levelNumber : 0x00DA1E38, 0x124;
	float igt : 0xDA2124, 0x27758;
}

startup
{
	vars.totalGameTime = 0;
}

start
{
	if (current.levelNumber == 0 && current.igt > old.igt) {
		vars.totalGameTime = 0;
		return true;
	}
}

split
{
	return (current.levelNumber > old.levelNumber);
}

isLoading
{
	return current.igt == old.igt;
}

gameTime
{
	if (current.igt == 0 && old.igt > 0) {
		vars.totalGameTime = vars.totalGameTime + old.igt;
	}
	return TimeSpan.FromSeconds(System.Convert.ToDouble(vars.totalGameTime + current.igt));
}