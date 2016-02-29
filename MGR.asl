state("METAL GEAR RISING REVENGEANCE")
{
	bool    control   : 0x148DD2C; // player control
	bool    load      : 0x14B9200; // is loading
	bool    ray1      : 0x1B21820; // Ray 1 split
	int     ray2      : 0x1E5A508, 0x4, 0x3ac, 0x4; // Ray 2 split
	string9 gStr      : 0x14B9181; // game location string
	string9 gStr2	  : 0x14B91AD; // game location string 2
	string4 gStr3     : 0x14B9231; // game location string 3
	int     rAnim     : 0x019C14C4, 0x788, 0x618; // Raiden's current animation
	int     samStrong : 0x19D9754 // Armstrong split for Sam DLC
}
startup
{
	settings.Add("Main Game");
	settings.Add("Sam DLC");
	vars.splitSettings = new List<string> {
		"Ray 1",
		"Ray 2",
		"Sam 1",
		"R00",
		"Blade Wolf",
		"Hammerhead",
		"Gate",
		"Hotel",
		"Mistral",
		"Sewers",
		"GRAD",
		"R02",
		"Doktor Elevator",
		"Railroad Skip",
		"Monsoon",
		"Offices",
		"Wallrun",
		"Freight Elevator",
		"Clone Fight",
		"Sundowner",
		"R05",
		"Sam 2",
		"Excelsus", 
		"Armstrong",
	};
	settings.CurrentDefaultParent = "Main Game";
	foreach (string splits in vars.splitSettings) {
		settings.Add(splits, false);
	}
	settings.CurrentDefaultParent = "Sam DLC";
	settings.Add("Samwolf", false, "Wolf");
	settings.Add("Samray", false, "Ray");
	settings.Add("Samvator", false, "Elevator");
	settings.Add("Samstrong", false, "Armstrong");
}
start
{
	if (current.gStr2 == "1_start" && old.gStr2 == "START") {
		timer.Run.Offset = new TimeSpan(9100000);
		return true;
	}
	else if (current.gStr == "1" && current.load) {
		timer.Run.Offset = new TimeSpan(39100000);
	    return true;
	}
}
split
{
	return settings["Ray 1"] && current.gStr == "ay01" && current.ray1 && !old.ray1 ||
           settings["Ray 2"] && current.gStr == "ay02_3" && current.ray2 == 5 && old.ray2 == 3 ||
           settings["Sam 1"] && current.gStr == "" && old.gStr == "am_3" ||
           settings["R00"] && current.gStr2 == "BEACH" && old.gStr2 == "" && current.gStr == "" ||
           settings["Blade Wolf"] && current.gStr == "WOLF"  && current.rAnim == 35 && old.rAnim == 33 && current.gStr3 != "STRE" ||
           settings["Hammerhead"] && (current.gStr == "SET" || current.gStr == "START") && old.gStr == "HELI01_EN" ||
           settings["Gate"] && current.gStr == "DOOR_CHEC" && old.gStr == "IN" ||
           settings["Hotel"] && (current.gStr == "HOTEL_IN" || current.gStr == "START") && old.gStr == "HOTEL_BTL" ||
           settings["Mistral"] && current.gStr == "MIST_RESU" && old.gStr == "MISTRAL03" ||
           settings["Sewers"] && current.gStr == "FIND_GATE" && current.rAnim != old.rAnim && current.rAnim == 43 ||
           settings["GRAD"] && current.gStr == "BOSS_END" && old.gStr == "ROBO_STAR" ||
           settings["R02"] && current.gStr == "EVENT2" && current.rAnim != old.rAnim && current.rAnim == 43 ||
           settings["Doktor Elevator"] && current.gStr == "ELV_IN" && (old.gStr == "OFFICE" || old.gStr == "ELV" || old.gStr == "ELV_END") ||
           settings["Railroad Skip"] && current.gStr == "START"  && old.gStr == "SUBWAY" ||
           settings["Monsoon"] && current.gStr == "MON_RESUL" && old.gStr == "FINISH_QT" ||
           settings["Offices"] && current.gStr == "GATE_END" && old.gStr == "GATE_OPEN" ||
           settings["Wallrun"] && current.gStr == "END" && old.gStr == "OUTER_WAL" ||
           settings["Freight Elevator"] && current.gStr3 == "END" && old.gStr3 == "RIDE"  ||
           settings["Clone Fight"] && current.gStr == "BTL_END" && old.gStr == "MON" ||
           settings["Sundowner"] && current.gStr == "SUN_RESUL" && old.gStr == "QTE" || 
           settings["R05"] && current.gStr == "" && old.gStr == "STREET" ||
           settings["Sam 2"] && current.gStr == "BOSS_END" && old.gStr == "BOSS" ||
           settings["Excelsus"] && current.gStr == "QTE" && (old.rAnim == 70 || old.rAnim == 266) && current.rAnim == 264 ||
           settings["Armstrong"] && current.rAnim == 297 && old.rAnim == 70 ||
           settings["Samwolf"] && current.gStr == "WOLF_END" && old.gStr != current.gStr ||
           settings["Samray"] && current.gStr == "RAY_END" && old.gStr == "RAY_RESUL" ||
           settings["Samvator"] && current.gStr == "START" && old.gStr == "ELV_END" ||
           settings["Samstrong"] && current.gStr == "QTE" && current.samStrong == 2 && old.samStrong == 1;
}

isLoading
{
	return current.load && !current.control;
}
init
{
	timer.IsGameTimePaused = false;
	exit
    {
        timer.IsGameTimePaused = true;
    }
}
