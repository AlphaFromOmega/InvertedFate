/// @description ?

// Inherit the parent event
event_inherited();

if (recieve != MONSTER_MS.NULL)
{
	if (spareable)
	{
		tb_string = S_BLACK + ":)";
	}
	else
	{
		switch (recieve)
		{
			case MONSTER_MS.NO_TARGET:
			{
				var _t = find_target_monster();
				show_debug_message(_t.recieve);
				switch (_t.recieve)
				{
					case MONSTER_MS.ATTACKED:
					{
						if (_t.hp <= 0)
						{
							tb_string = S_RED + "NOOOOOO";
						}
						else
						{
							tb_string = S_BLACK + "Are you alright, " + recieve.monster_name + "?";
						}
						break;
					}
					default:
					{
						if (act_count[0] > 0)
						{
							tb_string = S_BLACK + "No longer checking me out? :(";
						}
						else
						{
							tb_string = S_BLACK + "...";
						}
						break;
					}
				}
				break;
			}
			case MONSTER_MS.ATTACKED:
			{
				tb_string = S_BLACK + "Ow....";
				break;
			}
			case 0:
			{
				switch (act_count[0])
				{
					case 1:
					{
						tb_string = S_BLACK + "Checking me out?";
						break;
					}
					case 2:
					{
						tb_string = S_BLACK + "Still checking me out? :)";
						break;
					}
					case 3:
					{
						tb_string = S_BLACK + "Thanks for checking me out! :D";
						spareable = true;
						break;
					}
				}
			}
		}
	}
}
