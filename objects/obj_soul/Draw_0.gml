/// @description ?
if !(BATTLE.draw_type == GUI_DRAW.METER || BATTLE.hiearchy == HIEARCHY.BATTLE_WON || BATTLE.hiearchy == HIEARCHY.BUTTON_RESULT)
{
	if (inv == 0 || (inv div 4 % 2))
	{
		draw_self();
	}
}