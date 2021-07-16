/// @description ?
if (keyboard_check_pressed(ord("C")) && cd == 0)
{
	instance_destroy();
}

var change = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)) + (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up));

if (change != 0)
{
	selected += change;
	
	if (selected >= array_length(menu))
	{
		selected = 0;
	}
	if (selected < 0)
	{
		selected = array_length(menu) - 1;
	}
	audio_play_sound(sfx_switch, 100, false);
}

if (keyboard_check_pressed(ord("Z")))
{
	switch (selected)
	{
		
	}
}