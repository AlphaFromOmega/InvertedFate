///@function create_textbox(message, speed, font, sprite, voice, animation)
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
		str = string_to_array(convert_string(_message, GUI_TEXTBOX_WIDTH - (offset_spr + GUI_MARGIN*4)));
		show_debug_message(str);
	}
}

///@function convert_string(string, width)
function convert_string(_string, _width)
{
	var _i = 1;
	switch string_char_at(_string, _i)
	{
		case "[":
		{
			while (string_char_at(_string, _i) != "]")
			{
				_i++;
			}
			_i++;
			break;
		}
		case " ":
		{
			string_delete(_string, _i, 1);
			break;
		}
	}
	_string = string_insert("* ", _string, _i);
	_string = string_replace_all(_string, "#", "\n* ");
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
			_struct_string += "\n  ";
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
			var _func_string = "";
			while (string_char_at(_string, _i) != "]")
			{
				_func_string += string_char_at(_string, _i);
				_i++;
			}
			_func_string += string_char_at(_string, _i);
			_array[_j] = _func_string;
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