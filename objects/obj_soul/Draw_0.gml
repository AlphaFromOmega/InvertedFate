/// @description ?
if !(BATTLE.hiearchy == HIEARCHY.BUTTON_ACTION || BATTLE.hiearchy == HIEARCHY.BATTLE_WON)
{
	if (inv == 0 || (inv div 4 % 2))
	{
		draw_self();
	}
}