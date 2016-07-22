state("Cornerstone")
{
	bool isLoading  : 0xA32324, 0x1ac, 0x1c0, 0x488, 0x8;
    int  isLoading2 : 0xA30014;
}

isLoading
{
	return current.isLoading || current.isLoading2 > 300;
}
