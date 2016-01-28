state("METAL GEAR RISING REVENGEANCE")
{
    bool    control   : 0x148DD2C;                // player control
    bool    load      : 0x14B9200;                // is loading
    string9 gStr      : 0x14B9181;                // game location string
    string9 gStr2     : 0x14B91AD;                // game location string 2
    int     rAnim     : 0x019C14C4, 0x788, 0x618; // Raiden's current animation
}
 
split
{
    return current.gStr == "ay01" && current.rAnim != old.rAnim && current.rAnim == 3217010946  ||    /* Metal Gear Ray 1 Split */
           current.gStr == "ay02_3" && current.rAnim != old.rAnim && current.rAnim == 3221613820 ||   /* Metal Gear Ray 2 Split */
           current.gStr2 == "BEACH" && old.gStr2 == "" ||                                             /* Sam 1 Split */
           current.gStr == "WOLF"  && current.rAnim != old.rAnim && current.rAnim == 33  ||           /* Bladewolf Split */
           current.gStr == "HOTEL_IN" && old.gStr == "HOTEL" ||                                       /* Hotel Split */
           current.gStr == "MIST_RESU" && old.gStr == "MISTRAL03" ||                                  /* Mistral Split */
           current.gStr == "FIND_GATE" && current.rAnim != old.rAnim && current.rAnim == 43 ||        /* Sewer Split */
           current.gStr == "EVENT2" && current.rAnim != old.rAnim && current.rAnim == 43 ||           /* R02 split */
           current.gStr == "ELV_IN" && old.gStr == "OFFICE" ||                                        /* Elevator Split */
           current.gStr == "START" && old.gStr == "2ND" ||                                            /* Roof Skip Split */
           current.gStr == "MON_RESUL" && old.gStr == "FINISH_QT" ||                                  /* Monsoon Split */
           current.gStr == "GATE_END" && old.gStr == "GATE_OPEN" ||                                   /* Offices Split */
           current.gStr == "END" && old.gStr == "OUTER_WAL" ||                                        /* Wall Run Split */
           current.gStr == "BTL_END" && old.gStr == "MON" ||                                          /* Mistral + Monsoon Refight Split */
           current.gStr == "SUN_RESUL" && old.gStr == "QTE" ||                                        /* Sundowner Split */
           current.gStr == "" && old.gStr == "STREET" ||                                              /* Escape Split */
           current.gStr == "BOSS_END" && old.gStr == "BOSS" ||                                        /* Sam 2 Split */
           current.gStr == "QTE" && old.rAnim == 264 && current.rAnim == 70 ||                        /* Metal Gear Excelsus Split */
           current.rAnim == 297 && old.rAnim == 70;                                                   /* Armstrong Split */
}
 
isLoading
{
    return current.load && !current.control;
}