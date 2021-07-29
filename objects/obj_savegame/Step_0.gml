/// @description ?
if (!saved)
{
	selected += keyboard_check_pressed(vk_right) -  keyboard_check_pressed(vk_left);

	if (selected >= array_length(text))
	{
		selected = 0;
	}
	if (selected < 0)
	{
		selected = array_length(text) - 1;
	}
}

if (keyboard_check_pressed(ord("Z")))
{
	if (saved || selected == 1)
	{
		instance_destroy();
	}
	else
	{
		obj_global.saved_name = room_name;
		SaveGame();
		saved = true;
		audio_play_sound(sfx_savedgame, 0, false);
		QuickLoad();
	}
}