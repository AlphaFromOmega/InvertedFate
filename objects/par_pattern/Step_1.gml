/// @description Enable Attacks
if (BATTLE.hierarchy == HIERARCHY.DISABLED)
{
	if (start)
	{
		event_user(1);
		start = false;
	}
	event_user(0);
}