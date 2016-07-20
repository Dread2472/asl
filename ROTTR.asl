state("ROTTR")
{
bool ingameCutscene : 0x27D5EBC;
bool    isLoading  : 0xEF49E0;
}


isLoading
{
if(current.ingameCutscene || current.isLoading)
return true;
else
return false;
}