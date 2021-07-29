/// @description ?
var control = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down)) - (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up));
selected += control;
if (!gamepad_is_connected(0) && selected == 2)
{
	selected += control;
}
if (keyboard_check_pressed(ord("Z")))
{
	if (button_config)
	{
		switch (selected)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				break;
			}
			case 2:
			{
				break;
			}
		}
	}
	else
	{
		switch (selected)
		{
			case 0:
			{
				room_goto(rm_titlescreen);
				break;
			}
			case 2:
			{
				button_config = true;
				break;
			}
			case 3:
			{
				//Reset to default
				break;
			}
			default:
			{
				break;
			}
		}
	}
}