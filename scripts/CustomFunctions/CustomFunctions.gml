
/// string_extract(str,sep,index)
function string_extract(_str, _sep, _ind)
{
	var _len;
    _len = string_length(_sep)-1;
    repeat (_ind) _str = string_delete(_str,1,string_pos(_sep,_str)+_len);
    _str = string_delete(_str,string_pos(_sep,_str),string_length(_str));
    return _str;
}

function draw_text_custom(_x, _y, _str, _alpha)
{

	// Orginal Script by Yan Hülsebusch aka Chinafreak (Hule Studios) 31.07.2014
	// return string without commands

	// use [$='COLOR DIGITS'] to change color of text 
	// Example:
	/*
	    [$="+string(c_white)+"]White text by constant variable!
	    [$="+string(make_color_rgb(20,30,90))+"]Colored Text by make_color_rgb/hsv!
	    [$=8388736]or colored text in digits!
	*/

	var _xscale,_yscale, _precol, _prealpha, _strab, v1,v2,v3, d_color;

	_xscale = 1
	_yscale = 1

	_precol = draw_get_color()
	_prealpha = draw_get_alpha()

	_strab = _str
	_str = ""

	v1 = 0
	v2 = 0
	v3 = 0
	d_color = c_white

	var count;
	count = string_count("[$=",_strab) + string_count("\n",_strab)

	var str_part, str_color, str_length, str_height, str_check;
	str_check = false
	str_length = 0
	str_height = 0
	str_color[0] = _precol
	str_part[0] = ""

	draw_set_alpha(_alpha)
	//for (i=1; i<count+1; i+=1)
	var i;
	i = 0
	while(string_length(_strab)>0)
	{

	        if string_copy(_strab,0,3) = "[$="
			{
	            str_color[i] = string_copy(_strab,string_pos("[$=",_strab)+3,string_pos("]",_strab)-string_pos("[$=",_strab)-3)
	            _strab = string_replace(_strab,string_copy(_strab,0,string_pos("]",_strab)),"")
	            str_check = false
			}
			else{
	          if str_check{
	            str_check = false
	            str_color[i] = str_color[i-1]
	          }else{
	            str_color[i] = string(_precol)
	          }
	       }
	       /*
	       if str_check{
	          str_check = false
	          str_color[i] = str_color[i-1]
	       }else{
	          str_color[i] = string_copy(_strab,string_pos("[$=",_strab)+3,string_pos("]",_strab)-string_pos("[$=",_strab)-3)
	          _strab = string_replace(_strab,string_copy(_strab,0,string_pos("]",_strab)),"")
	       }
	       */
	       var _substr;
	       if string_copy(_strab,string_pos("[$=",_strab),3) = "[$="{ 
	          _substr = string_copy(_strab,0,string_pos("[$=",_strab)-1)
	       }else{
	          _substr = _strab
	       }
	       if string_copy(_substr,string_pos("\n",_substr),1) = "\n"{
	          str_part[i] = string_copy(_strab,0,string_pos("\n",_strab)-1)
	          str_check = true
	          _strab = string_replace(_strab,string_copy(_strab,0,string_pos("\n",_strab)),"")
                
	       }else{
       
	       if string_copy(_strab,string_pos("[$=",_strab),3) = "[$="{
	          str_part[i] = string_copy(_strab,0,string_pos("[$=",_strab)-1)
	       }else{
	          str_part[i] = _strab
	          _strab = ""
	       }
	       _strab = string_replace(_strab,string_copy(_strab,0,string_pos("[$=",_strab)-1),"")
       
	       }
	       //show_message(string(string_copy(str_color[i],0,2)))
	       if string_copy(str_color[i],0,3) = "rgb" or string_copy(str_color[i],0,14) = "make_color_rgb"{
	            str_color[i] = string_replace(str_color[i],"rgb(","")
	            str_color[i] = string_replace(str_color[i],"make_color_rgb(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = string_extract(str_color[i],",",0)
	            v2 = string_extract(str_color[i],",",1)
	            v3 = string_extract(str_color[i],",",2)
	            d_color = make_color_rgb(real(v1),real(v2),real(v3))
	       }else if string_copy(str_color[i],0,3) = "hsv" or string_copy(str_color[i],0,14) = "make_color_hsv"{
	            str_color[i] = string_replace(str_color[i],"rgb(","")
	            str_color[i] = string_replace(str_color[i],"make_color_rgb(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = string_extract(str_color[i],",",0)
	            v2 = string_extract(str_color[i],",",1)
	            v3 = string_extract(str_color[i],",",2)
	            d_color = make_color_hsv(real(v1),real(v2),real(v3))
	       }else if string_copy(str_color[i],0,11) = "merge_color"{
	            str_color[i] = string_replace(str_color[i],"merge_color(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = string_extract(str_color[i],",",0)
	            v2 = string_extract(str_color[i],",",1)
	            v3 = string_extract(str_color[i],",",2)
	            if string_digits(v1) != v1{
	                v1 = asset_get_index(v1)
	            }else if string_digits(v2) != v2{
	                v2 = asset_get_index(v2)
	            }
	            d_color = merge_color(real(v1),real(v2),real(v3))
	       }else if string_copy(str_color[i],0,1) = "u"{
	            str_color[i] = string_replace(str_color[i],"u(","")
	            str_color[i] = string_replace(str_color[i],")","")
	            v1 = real(string_extract(str_color[i],",",0))
	            v2 = real(string_extract(str_color[i],",",1))
	            draw_line_width(_x+str_length,_y+str_height+string_height(str_part[i])+v1,_x+str_length+string_width(str_part[i]),_y+str_height+string_height(str_part[i])+v1,v2)
            
	       }else{
	            var constant;
	            constant = (string_digits(str_color[i]) != str_color[i])
            
	            if constant{
	                d_color = real(asset_get_index(str_color[i]))
	            }else{
	                d_color= real(str_color[i])
	            }
	       }
       
	       draw_set_color(d_color)
	       draw_text_transformed(_x+str_length,_y+str_height,str_part[i],_xscale,_yscale,0)
	       str_length += string_width(str_part[i])
	       _str += str_part[i]
	       if str_check{
	          str_length = 0 
	          str_height += string_height("A")
	       }       
	i++
	};

	draw_set_alpha(_prealpha)
	draw_set_color(_precol)

	return _str
}

///@function custom_text_length(string, length)
// Inputs the length of a requested string, this returns the length including any functional characters within its length
function custom_text_length(_str, _length)
{
	_length = floor(_length);
	_length = clamp(_length, 0, string_length(_str));
	for (var i = 1; i < _length + 1; i++)
	{
		switch string_char_at(_str, i)
		{
			case "[":
			{
				var j = 0;
				while (string_char_at(_str, i + j) != "]")
				{
					j++;
					if (j > 128)
					{
						show_debug_message("ISSUE WITH STRING INSERTED INTO custom_text_length: Caught recursive loop with \"]\" search");
						break;
					}
				}
				i += j + 1;
				_length += j + 1;
				break;
			}
			case "\\":
			{
	            _length += 1;
				i += 1;
				break;
			}
		}
	};

	return _length
}

///@function draw_sprite_pscaled(sprite, subimage, x, y, xscale (in pixels), yscale (in pixels), rot, col, alpha)
// Does draw_sprite_ext with pixel scaling instead of relative scaling
function draw_sprite_pscaled(_sprite, _subimage, _x, _y, _xpscale, _ypscale, _rot, _col, _alpha)
{
	var _s_width = sprite_get_width(_sprite);
	var _s_height = sprite_get_height(_sprite);
	draw_sprite_ext(_sprite, _subimage, _x, _y, _xpscale/_s_width, _ypscale/_s_height, _rot, _col, _alpha);
}

function update_stats()
{
	global.max_hp = 16 + global.lv * 4;
	if (global.lv == 20)
	{
		global.max_hp = 99
	}
}

function change_music(_track)
{
	with (obj_global)
	{
		if (_track != global.music)
		{
			audio_stop_sound(global.music);
			global.music = _track;
			if (_track != noone)
			{
				audio_play_sound(global.music, 0, true);
			}
		}
	}
}