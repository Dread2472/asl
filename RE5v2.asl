state("re5dx9")
{
	byte isLoaded    : 0xDA2234;
    bool Cutscene    : 0xE39D2C, 0x268;
	int  levelNumber : 0xDA1E38, 0x124;
}

split
{
	return current.levelNumber > old.levelNumber;
}

isLoading
{
	return current.isLoaded == 116 || current.Cutscene;
}