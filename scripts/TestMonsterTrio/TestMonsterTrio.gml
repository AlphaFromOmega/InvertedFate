///@function name(values)
function TestMonsterTrio()
{
	var _mons = get_monsters();
	var _text = ""
	if (turn == 0)
	{
		_text = "The Test Monster Trio, triples the threat"
	}
	else
	{
		var _r = random(3)
		show_debug_message(_r)
		switch (round(_r))
		{
			case 0:
			{
				_text = "The Test Monster Trio are debugging the code"
				break;
			}
			case 1:
			{
				_text = "The Test Monsters watch blankly"
				break;
			}
			case 2:
			{
				_text = "The Test Monster Trio's trio of heads bob enthusiatically"
				break;
			}
			case 3:
			{
				_text = "The Test Monster Trio maintain 2 meters of distance"
				break;
			}
		}
	}
	return _text;
}