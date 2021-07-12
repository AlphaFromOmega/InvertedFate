/// @description ?
if !(BATTLE.draw_type == GUI_DRAW.METER || BATTLE.hierarchy == HIERARCHY.BATTLE_WON || BATTLE.hierarchy == HIERARCHY.BUTTON_RESULT)
{
	if (inv == 0 || (inv div 4 % 2))
	{
		draw_self();
	}
}