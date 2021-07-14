/// @description ?
if (alpha < 1)
{
	alpha += 0.005;
}
else
{
	print = typewriter(str[page_number], 15, sfx_voice_toriel);
	if (keyboard_check_pressed(ord("Z")) && array_length(print) == array_length(str[page_number]))
	{
		if (array_length(str) - 1 == page_number)
		{
			game_restart();
		}
		else
		{
			page_number++;
			typewriter_reset();
		}
	}
}