state("METAL GEAR RISING REVENGEANCE")
{
    bool playerControl : "METAL GEAR RISING REVENGEANCE.exe", 0x148DD2C;
    bool isLoading : "METAL GEAR RISING REVENGEANCE.exe", 0x14B9200;
	string9 gameString : "METAL GEAR RISING REVENGEANCE.exe", 0x14B9181;
	int raidenAnimation : "METAL GEAR RISING REVENGEANCE.exe", 0x019C14C4, 0x788, 0x618;
}

start
{
}

reset
{
}

split
{
	return current.gameString == "ay_ev" && old.gameString == "ay01" ||          /* Metal Gear Ray 1 Split */
		   current.gameString == "" && old.gameString == "ay02_3" ||             /* Metal Gear Ray 2 Split */
		   current.gameString == "" && old.gameString == "am_03" ||              /* Sam 1 Split */
		   current.gameString == "IN" && old.gameString == "WOLF" ||             /* Bladewolf Split */
		   current.gameString == "HELI01_EN" && old.gameString == "HELI01" ||    /* Hammerhead Split */
		   current.gameString == "MIST_RESU" && old.gameString == "MISTRAL03" || /* Mistral Split */
		   current.gameString == "BOSS_END" && old.gameString == "ROBO_STAR" ||  /* GRAD Split */
		   current.gameString == "START" && old.gameString == "2ND" || 			 /* Roof Skip Split */
		   current.gameString == "MON_RESUL" && old.gameString == "FINISH_QT" || /* Monsoon Split */
		   current.gameString == "END" && old.gameString == "OUTER_WAL" || 		 /* Wall Run Split */
		   current.gameString == "BTL_END" && old.gameString == "MON" || 		 /* Mistral + Monsoon Refight Split */
		   current.gameString == "SUN_RESUL" && old.gameString == "QTE" || 		 /* Sundowner Split */
		   current.gameString == "" && old.gameString == "STREET" || 			 /* Escape Split */
		   current.gameString == "BOSS_END" && old.gameString == "BOSS" || 		 /* Sam 2 Split */
		   current.gameString == "RESULT" && old.gameString == "QTE" || 		 /* Metal Gear Excelsus Split */
		   current.raidenAnimation == 297 && old.raidenAnimation == 70;          /* Armstrong Split */
}

isLoading
{
    return current.isLoading && !current.playerControl;
}