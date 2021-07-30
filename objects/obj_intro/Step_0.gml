/// @description ?
if (fade >= 1)
{
	y_location++;
	print = typewriter(text[page], 15, sfx_voice_generic);
	if (keyboard_check_pressed(ord("Z")))
	{
		if (page + 1 == array_length(sprites) || sprites[page + 1] != sprites[page])
		{
			fade_adjust *= -1;
			fade += fade_adjust;
		}
		else
		{
			page++;
			typewriter_reset();
		}
	}
}
else
{
	fade += fade_adjust;
	if (sign(fade_adjust) == -1 && fade <= 0)
	{
		fade_adjust *= -1;
		page++;
		typewriter_reset();
		print = [];
		if (page >= array_length(sprites))
		{
			room_goto(rm_ruins_flowey);
		}
	}
}
