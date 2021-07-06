
/// string_extract(str,sep,index)
function string_extract(_str, _sep, _ind)
{
	var _len;
    _len = string_length(_sep)-1;
    repeat (_ind) _str = string_delete(_str,1,string_pos(_sep,_str)+_len);
    _str = string_delete(_str,string_pos(_sep,_str),string_length(_str));
    return _str;
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