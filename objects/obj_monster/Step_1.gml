/// @description ?

// Inherit the parent event
event_inherited();

if (recieve != -2)
{
	if (recieve != -1)
	{
		act_count[recieve]++;
		switch (recieve)
		{
			case 0:
			{
				switch (act_count[0])
				{
					case 1:
					{
						tb_string = S_BLACK + "Checking me out?"
						break;
					}
					case 2:
					{
						tb_string = S_BLACK + "Still checking me out? :)"
						break;
					}
					case 3:
					{
						tb_string = S_BLACK + "Thanks for checking me out! :D"
						spareable = true;
						break;
					}
				}
			}
		}
	}
	else
	{
		if (tb_string == S_BLACK + "Checking me out?")
		{
			tb_string = S_BLACK + "No longer checking me out? :(";
		}
	}
	recieve = -2;
}
