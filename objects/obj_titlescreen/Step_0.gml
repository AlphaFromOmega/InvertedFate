/// @description ?

if (file_exists("save.dtr"))
{
	selected += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
	if (selected >= array_length(text))
	{
		selected = 0;
	}
	if (selected < 0)
	{
		selected = array_length(text) - 1;
	}
	if (keyboard_check_pressed(ord("Z")))
	{
		switch (selected)
		{
			case 0:
			{
				obj_global.room_x = obj_global.queued_x;
				obj_global.room_y = obj_global.queued_y;
				room_goto(obj_global.saved_room);
				break;
			}
			case 1:
			{
				room_goto(rm_name);
				break;
			}
			case 2:
			{
				room_goto(rm_settings);
				break;
			}
		}
	}
}
else
{
	selected += (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down)) - (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up));
	if (selected >= array_length(i_text))
	{
		selected = 0;
	}
	if (selected < 0)
	{
		selected = array_length(i_text) - 1;
	}
	
	if (keyboard_check_pressed(ord("Z")))
	{
		switch (selected)
		{
			case 0:
			{
				room_goto(rm_name);
				break;
			}
			case 1:
			{
				room_goto(rm_settings);
				break;
			}
		}
	}
}