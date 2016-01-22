state("DarkSoulsII", "1.2")
{
	int Loading : 0xFF9290, 0x108, 0xf8, 0x4, 0x1c0;
}

state("DarkSoulsII", "1.11")
{
	int Loading : 0x114A58C, 0x300, 0x65c, 0x64, 0x9c;
}

init
{
	switch (modules.First().FileVersionInfo.FileVersion) {
		case "1,0,2,0":
			version = "1.2";
			break;
		case "1,0,11,0":
			version = "1.11";
			break;
	}
}

isLoading
{
	if (version == "1.2") {
		return current.Loading == 1;
	} else {
		return current.Loading == 0;
	}
}

