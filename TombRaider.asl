/* 	Tomb Raider (2013) autosplitter and load remover
	Original load remover and IGT pausing by Dread
	Updated load remover, autosplitter and settings by Cadarev (@CadarevElry, Discord: Cadarev#8544) with help from Toxic_TT and rythin_sr.
    Thank you to clove for additional testing. */
	//updated for epic games store and latest patch of steam by TpRedNinja and DeathHound(Discord DeathHound)
	
state("TombRaider", "Steam_743.0")
{
    bool FMV				: "binkw32.dll", 0x2830C; //this works on all versions of the game regardless of patch or platform
    int cutsceneValue		: 0x211AB5C; //520 in most cutscenes but not 712 during final cutscene. 712 first cutscene then 520 then 8 for dragging cutscene
	int skippableCutscene	: 0x176F070; //1065353216 for when not skippable and when in main menu, 0 for when it is skippable and when your loading it seems to stay at 0
    bool isLoading			: 0x1E33250; //very simple just detects if loading bool just means 1 and 0. 1 for true and 0 for false 
	
	string50 level			: 0x1E28EA8; //detects level change, first 2 cutscenes are cine_chaos_beach, main menu is main_menu_1, when in drappging cutscene its survival_den97
	
	bool newGameSelect		: 0x0211FEAC, 0x100, 0x24; //changes number base off the difficulty you choose 0 for easy 1 for normal which is deult and 2 for hard
	int saveSlot			: 0x0211FEAC, 0xFC, 0x24; //literally the saveslot number
	
	int bowAmmo				: 0x21203F0; //says bow ammo but can detect other weapons ammo as well whole point of this is for bow split
}

state("TombRaider","Steam_Current" )
{
    bool FMV				: "binkw32.dll", 0x2830C; //this works on all versions of the game regardless of patch or platform
    int cutsceneValue		: 0x20C97C0; //520 in most cutscenes but not 712 during final cutscene. 712 first cutscene then 520 then 8 for dragging cutscene
	int skippableCutscene	: 0x1B460DC; //1065353216 for when not, is 0 when it is skippable. Note it stays to whatever value it was when you leave to the main menu
    bool isLoading			: 0x1E33250; //very simple just detects if loading bool just means 1 and 0. 1 for true and 0 for false 
	
	string50 level			: 0x1DC18D8; //detects level change, first 2 cutscenes are cine_chaos_beach, main menu is main_menu_1, when in drappging cutscene its survival_den97
	
	bool newGameSelect		: 0x020CF83C, 0x100, 0x24; //changes number base off the difficulty you choose 0 for easy 1 for normal which is deult and 2 for hard
	int saveSlot			: 0x020CF83C, 0xFC, 0x24; //literally the saveslot number
	int bowAmmo				: 0x20CFD80; //says bow ammo but can detect other weapons ammo as well whole point of this is for bow split
}

state("TombRaider", "Epic")
{
	bool FMV				: "binkw32.dll", 0x2830C; //this works on all versions of the game regardless of patch or platform
    int cutsceneValue		: 0x20C7DBC; //520 in most cutscenes but not 712 during final cutscene. 712 first cutscene then 520 then 8 for dragging cutscene
	int skippableCutscene	: 0x1DC3634; //1065353216 for when not skippable and when in main menu, 0 for when it is skippable and when your loading it seems to stay at 0
    bool isLoading			: 0x1CF6960; //very simple just detects if loading bool just means 1 and 0. 1 for true and 0 for false 
	
	string50 level			: 0x1DBF218; //detects level change, first 2 cutscenes are cine_chaos_beach, main menu is main_menu_1, when in drappging cutscene its survival_den97
	
	bool newGameSelect		: 0x020CDF00, 0x100, 0x24; //changes number base off the difficulty you choose 0 for easy 1 for normal which is deult and 2 for hard
	int saveSlot			: 0x020CDF00, 0xFC, 0x24; //literally the saveslot number
	
	int bowAmmo				: 0x20CE450; //says bow ammo but can detect other weapons ammo as well whole point of this is for bow split
}

init
{
	//Unpauses the ingame timer when hooking into the game.
    timer.IsGameTimePaused = false;

	// Detecting the game version based on SHA-256 hash
	byte[] checksum = vars.CalcModuleHash(modules.First());    
	if (Enumerable.SequenceEqual(checksum, vars.TR13_Steam_743))
    version = "Steam_743.0";
	else if(Enumerable.SequenceEqual(checksum, vars.TR13_Steam_Current)) 
    version = "Steam_Current";
	else if(Enumerable.SequenceEqual(checksum, vars.TR13_Epic)) 
    version = "Epic";
}

startup
{
	//SHA256: 187a3cd7055e5602ef263105d47fcecdc2a919c546e748d79a4ea587fb611889 hash id for steam version build 743
	vars.TR13_Steam_743 = new byte[32]{ 0x18, 0x7a, 0x3c, 0xd7, 0x05, 0x5e, 0x56, 0x02, 0xef, 0x26, 0x31, 0x05, 0xd4, 0x7f, 0xce, 0xcd, 0xc2, 0xa9, 0x19, 0xc5, 0x46, 0xe7, 0x48, 0xd7, 0x9a, 0x4e, 0xa5, 0x87, 0xfb, 0x61, 0x18, 0x89 };
	//SHA256: f36b8dd2bd74d48c14bf910ad9bd4ac9f4024433523ffc7e46d5c85c3dd618f5 hash id for steam version latest patch
	vars.TR13_Steam_Current = new byte[32]{ 0xf3, 0x6b, 0x8d, 0xd2, 0xbd, 0x74, 0xd4, 0x8c, 0x14, 0xbf, 0x91, 0x0a, 0xd9, 0xbd, 0x4a, 0xc9, 0xf4, 0x02, 0x44, 0x33, 0x52, 0x3f, 0xfc, 0x7e, 0x46, 0xd5, 0xc8, 0x5c, 0x3d, 0xd6, 0x18, 0xf5 };
	//SHA256 B3136AF4401CC02ABF7A70D490EFCDD5611F186DAC51B78444B2156EF363C399 hash id for epic games store version of game
	vars.TR13_Epic = new byte[32]{ 0xB3, 0x13, 0x6A, 0xF4, 0x40, 0x1C, 0xC0, 0x2A, 0xBF, 0x7A, 0x70, 0xD4, 0x90, 0xEF, 0xCD, 0xD5, 0x61, 0x1F, 0x18, 0x6D, 0xAC, 0x51, 0xB7, 0x84, 0x44, 0xB2, 0x15, 0x6E, 0xF3, 0x63, 0xC3, 0x99 };
	//Calculates the hash id for the current module credit to the re2r autosplitter & deathHound on discord for this code 
    Func<ProcessModuleWow64Safe, byte[]> CalcModuleHash = (module) => {
        print("Calculating hash of " + module.FileName);
        byte[] checksum = new byte[32];
        using (var hashFunc = System.Security.Cryptography.SHA256.Create())
            using (var fs = new FileStream(module.FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete))
                checksum = hashFunc.ComputeHash(fs);
        return checksum;
    };
	vars.CalcModuleHash = CalcModuleHash;
	
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
	vars.Helper.Settings.CreateFromXml("Components/TR2013.Settings.xml");
	
	vars.testLoadRemover = false;
	
	//List containing all completed splits during the run, to prevent repeated splits occurring because of the same condition.
	vars.completedSplits = new List<string>();
	
	//Asks user if they  want to change to game time if the comparison is set to real time on startup.
	if(timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show(
            "This game uses Game Time (without loads) as the main timing method. "+
            "LiveSplit is currently set to display and compare against Real Time (including loads).\n\n"+
            "Would you like the timing method to be set to Game Time?",
            "Tomb Raider (2013) | LiveSplit",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        if (timingMessage == DialogResult.Yes) timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

update
{
	vars.testLoadRemover = (current.skippableCutscene == 0 || current.isLoading || current.FMV);
}

start
{
	//Set starting time to 0 seconds and clear the list of completed splits
	timer.Run.Offset = TimeSpan.FromSeconds(0);
	vars.completedSplits.Clear();
	
	//Starts timer when opening FMV starts (after choosing difficulty)
	if(current.level == "cine_chaos_beach" && old.level != "cine_chaos_beach")
	{
		return true;
	}
	
	//Starts timer when loading the first checkpoint from save slot one and sets the starting time to 1:46.
	if(current.level == "survival_den97" && old.isLoading && !current.isLoading && current.saveSlot == 1)
	{
		timer.Run.Offset = TimeSpan.FromSeconds(106);
		return true;
	}
}

split
{
	//Level is shortly empty during loading screens. To be able to split on fast travels, the old level value has to be copied into the current one when the latter is empty.
	if(current.level == "")
	{
		current.level = old.level;
		return false;
	}
	
	//Most splits are triggered based on level transitions. When triggered, they get added to a list which is always checked to prevent repeatedly splitting on the same level transitions.
	if(old.level != current.level)
	{	
		string levelTransition = old.level + "_" + current.level;
		
		if(settings.ContainsKey(levelTransition) && !vars.completedSplits.Contains(levelTransition) && settings[levelTransition])
		{
			vars.completedSplits.Add(levelTransition);
			return true;
		}
	}
	
	//Bow, splits when ammo count changes to a value above 0 (ammo count is always -1 during loading screens)
	if(current.level == "ac_forest" && !vars.completedSplits.Contains("Bow") && current.bowAmmo > old.bowAmmo && old.bowAmmo > -1 && settings["Bow"])
	{
		vars.completedSplits.Add("Bow");
		return true;
	}
	
	//Wolves, splits when FMV at campfire ends
	if(current.level == "ww2_sos_01" && !vars.completedSplits.Contains("Wolves") && old.FMV && !current.FMV && settings["Wolves"])
	{
		vars.completedSplits.Add("Wolves");
		return true;
	}
	
	//Final split
	if(current.level == "qt_the_ritual" && old.cutsceneValue != 712 && current.cutsceneValue == 712 && settings["Mathias"])
	{
		return true;
	}
}

isLoading
{
	//New load remover
    //return current.skippableCutscene || current.isLoading || current.FMV;
	
	//Old load remover
	return current.cutsceneValue == 520 || current.isLoading || current.FMV;

}

reset
{
	//Resets when the difficulty selection for a new game pops up or when the second save slot is loaded and it is in the first area of the game (for copying over the initial save when starting from a savefile).
	if((current.level == "main_menu_1" && current.newGameSelect) || (current.level == "survival_den97" && old.isLoading && !current.isLoading && current.saveSlot == 2))
		return true;
}

exit
{
	//Pauses ingame timer if hook to the game is lost (e.g. when game crashes).
    timer.IsGameTimePaused = true;
}
