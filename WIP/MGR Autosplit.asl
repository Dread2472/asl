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
}

split
{
	return current.gStr == "ay01" && current.ray1 && !old.ray1  ||    					 /* Metal Gear Ray 1 Split */
	       current.gStr == "ay02_3" && current.ray2 == 5 && old.ray2 == 3  ||   				 /* Metal Gear Ray 2 Split */
	       current.gStr2 == "BEACH" && old.gStr2 == "" && current.gStr == "" ||          			 /* Sam 1 Split */
	       current.gStr == "WOLF"  && current.rAnim == 35 && old.rAnim == 33 && current.gStr3 != "STRE"  ||  /* Bladewolf Split */
	       (current.gStr == "HOTEL_IN" || current.gStr == "START") && old.gStr == "HOTEL_BTL" ||  		 /* Hotel Split */
	       current.gStr == "MIST_RESU" && old.gStr == "MISTRAL03" || 					 /* Mistral Split */
	       current.gStr == "FIND_GATE" && current.rAnim != old.rAnim && current.rAnim == 43 ||  		 /* Sewer Split */
               current.gStr == "EVENT2" && current.rAnim != old.rAnim && current.rAnim == 43 ||  		 /* R02 split */
	       current.gStr == "ELV_IN" && (old.gStr == "OFFICE" || old.gStr == "ELV") ||      			 /* Elevator Split */
               current.gStr == "START"  && old.gStr == "SUBWAY" ||           					 /* Roof Skip Split */
	       current.gStr == "MON_RESUL" && old.gStr == "FINISH_QT" || 					 /* Monsoon Split */
               current.gStr == "GATE_END" && old.gStr == "GATE_OPEN" ||  					 /* Offices Split */
	       current.gStr3 == "END" && old.gStr3 == "RIDE"  ||       						 /* Freight Elevator Split */
	       current.gStr == "SUN_RESUL" && old.gStr == "QTE" ||       					 /* Sundowner Split */
	       current.gStr == "" && old.gStr == "STREET" ||             					 /* Escape Split */
	       current.gStr == "BOSS_END" && old.gStr == "BOSS" ||       					 /* Sam 2 Split */
	       current.gStr == "QTE" && (old.rAnim == 70 || old.rAnim == 266) && current.rAnim == 264 ||         /* Metal Gear Excelsus Split */
	       current.rAnim == 297 && old.rAnim == 70;          						 /* Armstrong Split */
}

isLoading
{
	return current.load && !current.control;
}
