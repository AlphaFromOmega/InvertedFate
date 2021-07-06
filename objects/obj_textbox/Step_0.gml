/// @description Insert description here
// You can write your code in this editor
hmargin = GUI_MARGIN_H;
if (l  < array_length(str))
{
	l = clamp(l + (change / room_speed), 0, array_length(str));
}


if (keyboard_check_pressed(ord("X")))
{
	l = array_length(str);
	for (var i = 0; i <= array_length(str) - 1; i++)
	{
		print[i] = str[i];
	}
}

if ((array_length(str) > l))
{
	for (var i = 0; i <= min(l, array_length(str) - 1); i++)
	{
		print[i] = str[i];
		if (string_lettersdigits(string_char_at(str[l], 1)) == "")
		{
			l++;
		}
	}
	if (string_lettersdigits(string_char_at(str[l], 1)) != "" && char != floor(l))
	{
		char = floor(l);
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