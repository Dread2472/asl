state("Soma")
{
	string255 mapString : "Soma.exe", 0x7FCD80, 0x198, 0x0;
}

state("Soma_NoSteam")
{
	string255 mapString : "Soma_NoSteam.exe", 0x77EBB0, 0x198, 0x0;
}

init
{
	/* I have no idea how to do this gg me */
}

start
{
	return current.mapString == "00_00_intro.hpm" && old.mapString == "" ||
	       current.mapString == "00_00_intro.hpm" && old.mapString == "main_menu.hpm"
}

split
{
	return current.mapString == "01_01_upsilon_awake.hpm" && old.mapString == "00_03_laboratory.hpm" ||            /* Intro Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Upsilon Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* CURIE Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Zeppelin Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Theta Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Omicron Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Tau Split */
	       current.mapString == "01_01_upslon_awake.hpm" && old.mapString == "01_01_upslon_awake.hpm" ||           /* Phi Split */
	       current.mapString == "05_03_space.hpm" && old.mapString == "05_02_ark_inside.hpm"                       /* ARK/Done Split */
}

isLoading
{
}