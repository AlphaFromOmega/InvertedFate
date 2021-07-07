/// @description ?
if (init)
{
	string_text = string_to_array(convert_string(text, bbox_right-bbox_left, fnt_textbubble, false))
	init = false;
}

print = typewriter(string_text, 15);