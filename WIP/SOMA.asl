state("Soma")
{
	// pointers are declared in init since we locate them at runtime
}

state("Soma_NoSteam")
{
	
}

init
{
	vars.ready = false;

	// ** locate gpBase so the script doesn't have to be updated for every game update **
	
	var scanner = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize);
	
	// \xC7.\x78\x03\x00\x00\x06\x00\x00\x00\x48\x8B.....
	// near usage of "Loading save file failed, file corrupt"
	var addr = scanner.Scan(new SigScanTarget(13,
		"C7 ?? 78 03 00 00 06 00 00 00", // mov     dword ptr [rbx+378h], 6
		"48 8B"/*?? ?? ?? ?? ??*/));     // mov     rax,                  cs:gpBase
		
	if (addr == IntPtr.Zero)
	{
		print("couldn't locate gpBase");
		return;
	}
	
	var offset = memory.ReadValue<int>(addr); // instruction offset literal
	addr += 4; // go to next instruction for offset calculation
	var gpBase = (int)((long)addr + offset - (long)modules.First().BaseAddress);
	print("gpBase is at " + gpBase.ToString("X"));
	
	vars.watchers = new MemoryWatcherList();
	vars.watchers.Add(new StringWatcher      (new DeepPointer(gpBase, 0x198, 0x000), 255)  { Name = "map" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(gpBase, 0x0F8, 0x2AC))       { Name = "StaticLoadVar1" });
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(gpBase, 0x0F8, 0x2B0))       { Name = "StaticLoadVar2" });
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(gpBase, 0x0F8, 0x2B1))       { Name = "StaticLoadVar3" });
	
	vars.ready = true;
}

update
{
	if (!vars.ready)
		return;

	vars.watchers.UpdateAll(game);
}

start
{
	if (!vars.ready)
		return;

	var map = vars.watchers["map"];
	return map.Current == "00_01_apartment.hpm" && map.Old == null ||
	       map.Current == "00_01_apartment.hpm" && map.Old == "00_00_intro.hpm";
}

split
{
	if (!vars.ready)
		return;

	var map = vars.watchers["map"];
	return map.Current == "01_01_upsilon_awake.hpm"    && map.Old == "00_03_laboratory.hpm"   ||        // Intro
	       map.Current == "01_01_upslon_outside.hpm"   && map.Old == "01_02_upslon_inside.hpm" ||       // Upsilon
	       map.Current == "02_02_ms_curie_inside.hpm"  && map.Old == "02_01_ms_curie_outside.hpm" ||    // Enter CURIE
	       map.Current == "02_03_delta.hpm"            && map.Old == "02_02_ms_curie_inside.hpm" ||     // Escape CURIE
	       map.Current == "02_05_theta_inside.hpm"     && map.Old == "02_04_theta_outside.hpm" ||       // Zeppelin/Delta
	       map.Current == "03_01_omicron_outside.hpm"  && map.Old == "02_07_theta_exit.hpm" ||          // Theta
	       map.Current == "03_03_omicron_descent.hpm"  && map.Old == "03_02_omicron_inside.hpm" ||      // Omicron
	       map.Current == "05_01_phi_inside.hpm"       && map.Old == "04_03_tau_escape.hpm" ||          // Tau
	       map.Current == "05_02_ARK_inside.hpm"       && map.Old == "05_01_phi_inside.hpm" ||          // Phi
	       map.Current == "05_03_space.hpm"            && map.Old == "05_02_ARK_inside.hpm";            // ARK/Done
}


isLoading
{
	if (!vars.ready)
		return;

	// emulate cLuxSaveHandler::IsDoneLoadingSavedGame
	var static1 = (byte)vars.watchers["StaticLoadVar1"].Current;
	var static2 = (bool)vars.watchers["StaticLoadVar2"].Current;
	var static3 = (bool)vars.watchers["StaticLoadVar3"].Current;
	
	return (static1 > 0 && static1 != 6) || (static1 == 6 && (!static2 || !static3));
	
	// TODO: add other load types
}
