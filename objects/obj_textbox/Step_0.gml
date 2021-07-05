/// @description Insert description here
// You can write your code in this editor
hmargin = GUI_MARGIN_H;
l += change;
print = string_copy(str, 1, custom_text_length(str, l/room_speed));

if (keyboard_check_pressed(ord("X")))
{
	l = room_speed * string_length(str);
	print = string_copy(str, 1, string_length(str));
}

if ((string_length(str) >= custom_text_length(str, l/room_speed)))
{
	if ((l div room_speed*2 != char) && string_copy(print,custom_text_length(str, l/room_speed)-1,1) != " ")
	{
		char = l div room_speed*2;
		audio_play_sound(voice, 2, false);
	}
}
else
{
	if (keyboard_check_pressed(ord("Z")))
	{
		if (instance_exists(obj_textbox_queue))
		{
			with (obj_textbox_queue)
			{
				ticket--;
			}
		}
		instance_destroy();
	}
}
if (sprite_exists(head))
{
	sprite_index = head;
}