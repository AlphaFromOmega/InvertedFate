/// @description ?
if (init)
{
	string_text = string_to_array(convert_string(text, bbox_right-bbox_left, fnt_textbubble, false))
	init = false;
}

if (BB.lerp_prog > 0.5)
{
	print = typewriter(string_text, 15);
}