///@function create_textbox(message, speed, [font], [sprite], [voice], [animation])
function create_textbox(_message, _speed)
{
	var _font = (argument_count > 2) ? argument[2] : fnt_textbox;
	var _sprite = (argument_count > 3) ? argument[3] : noone;
	var _voice = (argument_count > 4) ? argument[4] : noone;
	var _animation = (argument_count > 5) ? argument[5] : 0;
	
	var _obj;
	if (instance_exists(obj_textbox))
	{
		_obj = obj_textbox_queue;
	}
	else
	{
		_obj = obj_textbox;
	}
	with (instance_create_depth(0, 0, 0, _obj))
	{
		//if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		change = _speed;
		voice = _voice;
		head = _sprite;
		font = _font;
		animation = _animation;
		offset_spr = sprite_exists(_sprite) ? 144 : 0; 
		str = string_to_array(convert_string(_message, GUI_TEXTBOX_WIDTH - (offset_spr + GUI_MARGIN*4), _font));
	}
}

///@function convert_string(string, width, [font], astricks)
function convert_string(_string, _width)
{
	var _font = (argument_count > 2) ? argument[2] : fnt_textbox;
	var _a = (argument_count > 3) ? argument[3] : true;
	draw_set_font(_font);
	var _i = 1;
	switch string_char_at(_string, _i)
	{
		case "[":
		{
			switch (string_char_at(_string, _i+1))
			{
				case "$":
				{
					while (string_char_at(_string, _i) != "]")
					{
						_i++;
					}
					_i++;
					break;
				}
				default:
				{
					break;
				}
			}
			break;
		}
		case " ":
		{
			string_delete(_string, _i, 1);
			break;
		}
	}
	if (_a)
	{
		_string = string_insert("* ", _string, _i);
		_string = string_replace_all(_string, "#", "\n* ");
	}
	else
	{
		_string = string_replace_all(_string, "#", "\n");
	}
	//var _s_width = string_width(_string);
	var _s_length = string_length(_string);
	
	var _struct_string = "";
	var _word_string = "";
	
	
	var _last_width = 0;
	var _last_space = 0;
	
	for (var _i = 1; _i < _s_length + 1; _i++)
	{
		switch (string_char_at(_string, _i))
		{
			case "[":
			{
				var _func_string = "";
				var _j = _i;
				while !(string_pos(string_char_at(_string, _j), "]"))
				{
					_struct_string += string_char_at(_string, _j);
					_j++;
				}
				_i = _j;
				_struct_string += _func_string + "]";
				continue;
				break;
			}
			case "\n":
			{
				_struct_string += _word_string + "\n";
				_word_string = "";
				_last_width = 0;
				continue;
				break;
			}
			default:
			{
				_word_string = _word_string + string_char_at(_string, _i);
				break;
			}
		}
		if ((_last_width + string_width(_word_string)) > _width)
		{
			if (_a)
			{
				_struct_string += "\n  ";
			}
			else
			{
				_struct_string += "\n";
			}
			_last_width = 0;
			_last_space = _i;
		}
		if (string_char_at(_string, _i) == " ")
		{
			_struct_string += _word_string
			_last_width += string_width(_word_string);
			_last_space = _i;
			_word_string = "";
		}
	}
	_struct_string += _word_string
	return _struct_string;
}

///@function string_to_array(string)
function string_to_array(_string)
{
	var _string_length = string_length(_string);
	var _array;
	var _j = 0;
	for (var _i = 1; _i < _string_length + 1; _i++;)
	{
		if (string_char_at(_string, _i) != "[")
		{
			_array[_j] = string_char_at(_string,_i);
		}
		else
		{
			switch string_char_at(_string, _i + 1)
			{
				case "$":
				{
					var _func_string = "";
					while (string_char_at(_string, _i) != "]")
					{
						_func_string += string_char_at(_string, _i);
						_i++;
					}
					_func_string += string_char_at(_string, _i);
					_array[_j] = _func_string;
					break;
				}
				default:
				{
					_array[_j] = string_char_at(_string,_i);
					break;
				}
			}
		}
		_j++;
	}
	return _array;
}

///@function draw_text_special(x, y, string, animation)
function draw_text_special(_x, _y, _string, _animation)
{
	var _total_length = 0;
	var _total_height = 0;
	var _sh = string_height("A");
	for (var _i = 0; _i < array_length(_string); _i++)
	{
		switch string_char_at(_string[_i], 1)
		{
			case "\n":
			{
				_total_height += _sh;
				_total_length = 0;
				break;
			}
			case "[":
			{
				switch string_char_at(_string[_i], 2)
				{
					case "$":
					{
						string_last_pos("]", _string[_i])
						var _col = real(string_lettersdigits(_string[_i]));
						draw_set_color(_col);
						break;
					}
					default:
					{
						var _offset_x = 0;
						var _offset_y = 0;
						switch (_animation)
						{
							default: case 0:
							{
								if (random(100) < 0.1)
								{
									_offset_x += random_range(-2, 2);
									_offset_y += random_range(-2, 2);
								}
								break;
							}
							case 1:
							{
								_offset_x += random_range(-2, 2);
								_offset_y += random_range(-2, 2);
								break;
							}
						}
						_total_length += string_width(_string[_i]);
						draw_text(_x + _offset_x + _total_length, _y + _offset_y + _total_height, _string[_i]);
						break;
					}
				}
				break;
			}
			default:
			{
				var _offset_x = 0;
				var _offset_y = 0;
				switch (_animation)
				{
					default: case 0:
					{
						if (random(100) < 0.1)
						{
							_offset_x += random_range(-2, 2);
							_offset_y += random_range(-2, 2);
						}
						break;
					}
					case 1:
					{
						_offset_x += random_range(-2, 2);
						_offset_y += random_range(-2, 2);
						break;
					}
				}
				_total_length += string_width(_string[_i]);
				draw_text(_x + _offset_x + _total_length, _y + _offset_y + _total_height, _string[_i]);
			}
		}
	}
}
function typewriter_init()
{
	typewriter_reset();
}
function typewriter_reset()
{
	tw_letter = 0;
	tw_last_letter = 0;
}
///@function typewriter(string_array, [speed], [sound])
function typewriter(_str)
{
	var _spd = (argument_count > 1) ? argument[1] : 15;
	var _sfx = (argument_count > 2) ? argument[2] : noone;
	if (keyboard_check_pressed(ord("X")))
	{
		tw_letter = array_length(_str);
	}
	var _print = [];
	tw_letter = clamp(tw_letter + (_spd * delta_time/1000000), 0, array_length(_str));
	var tw_clamped = min(tw_letter, array_length(_str) - 1)
	if (tw_last_letter != floor(tw_letter) && string_lettersdigits(string_char_at(_str[tw_clamped], 1)) != "")
	{
		if (audio_exists(_sfx))
		{
			audio_play_sound(_sfx, 100, false);
		}
		tw_last_letter = floor(tw_letter);
	}
	for (var i = 0; i < min(tw_letter, array_length(_str)); i++)
	{
		_print[i] = _str[i];
		if (array_length(_str) > tw_letter && string_lettersdigits(string_char_at(_str[tw_clamped], 1)) == "[")
		{
			tw_letter++;
			tw_clamped = min(tw_letter, array_length(_str) - 1);
		}
	}
	return _print;
}
///@function create_array(x1, x2, x3...)
function create_array()
{
	var _array;
	for (var i = 0; i < argument_count; i++)
	{
		_array[i] = argument[i]
	}
	return _array
}