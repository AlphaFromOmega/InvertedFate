//@function damage_player(amount)
function damage_player(_amount)
{
	if (instance_exists(obj_soul))
	{
		if (obj_soul.inv == 0)
		{
			global.hp = clamp(global.hp - _amount, 0, global.max_hp);
			obj_soul.inv = global.inv;
			audio_play_sound(sfx_player_hit, 100, false);
			if (variable_instance_exists(id, "destructable") && destructable)
			{
				instance_destroy();
			}
		}
	}
}

function end_turn()
{
	show_debug_message("Turn Over");
	BATTLE.hiearchy = HIEARCHY.ACTION_BUTTONS;
	BATTLE.spawned = 0;
	BATTLE.draw_type = GUI_DRAW.FLAVOUR_TEXT;
	with (obj_pattern)
	{
		instance_destroy();
	}
	destined_box(BATTLE.textbox_x1, BATTLE.textbox_y1, BATTLE.textbox_x2, BATTLE.textbox_y2)
}

function get_square_points(_originx, _originy, _length)
{
	var points;
	points[0] = _originx - _length/2;
	points[1] = _originy - _length/2;
	points[2] = _originx + _length/2;
	points[3] = _originy + _length/2;
	return points;
}

function destined_box(_x1, _y1, _x2, _y2)
{
	BATTLE.destined_x1 = _x1;
	BATTLE.destined_y1 = _y1;
	BATTLE.destined_x2 = _x2;
	BATTLE.destined_y2 = _y2;
	BATTLE.lerp_prog = 0;
}
function create_circular_attack(_object, _target_x, _target_y, _radius, _amount, _angular_offset)
{
	var _ins;
	for (var i = 0; i < _amount; i++)
	{
		var _length_dir = (360/_amount) * i + _angular_offset;
		var _x = lengthdir_x(_radius, _length_dir);
		var _y = lengthdir_y(_radius, _length_dir);
		_ins[i] = instance_create_layer(_target_x + _x, _target_y + _y, "Attacks", _object);
	}
	return _ins;
}