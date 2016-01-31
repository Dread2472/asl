state("ROTTR")
{
	bool isLoading : 0x2879690, 0x598, 0x84;
}

isLoading
{
	return current.isLoading;
}