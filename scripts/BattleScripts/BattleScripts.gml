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
function get_monsters()
{
	var _monster;
	for (var i = 0; i < instance_number(par_monster); i++;)
	{
		_monster[i] = instance_find(par_monster, i);
	}
	return _monster;
}
function find_target_monster()
{
	var _target
	with (par_monster)
	{
		if (recieve != MONSTER_MS.NO_TARGET)
		{
			_target = id
		}
	}
	return _target;
}

/// @function change_hieachy([amount])
function change_hiearchy()
{
	var _change = (argument_count > 0) ? argument[0] : 0;
	
	typewriter_reset();
	print = [];
	hiearchy += _change;
	
	switch (hiearchy)
	{
		case HIEARCHY.DISABLED:
		{
			instance_destroy(obj_textbubble);
			draw_type = GUI_DRAW.NONE;
			instance_create_depth(0, 0, 0, pat_debug_bone);
			
			turn++;
			str = string_to_array(convert_string(script_execute(flavour_script), (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25)));
			break;
		}
		
		case HIEARCHY.ACTION_BUTTONS: // If the hiearchy variable is for the action buttons, display flavour text
		{
			draw_type = GUI_DRAW.FLAVOUR_TEXT;
			break;
		}
		
		case HIEARCHY.UI_BUTTONS: // If the hiearchy variable is for the ui buttons, check the responses for each selected button
		{
			switch (selected_button)
			{
				case BUTTON.FIGHT: // If fight is selected check for all monsters which are alive and have not been spared and display them in a list
				{
					selected_option = 0;
					draw_type = GUI_DRAW.MONSTERS;
					display_length = 0;
					for (var i = 0; i < 6; i++)
					{
						display[i] = noone;
					}
					for (var i = 0; i < array_length(monsters); i++)
					{
						if (monsters[i] != noone && monsters[i].present && monsters[i].hp > 0)
						{
							for (var j = 0; j < array_length(display); j++)
							{
								if (display[j] == noone)
								{
									display[j] = monsters[i];
									display_length++;
									break;
								}
							}
						}
					}
					break;
				}
				case BUTTON.ACT: // If act is selected check for all monsters which are alive and have not been spared and display them in a list
				{
					selected_option = 0;
					draw_type = GUI_DRAW.MONSTERS;
					display_length = 0;
					for (var i = 0; i < 6; i++)
					{
						display[i] = noone;
					}
					for (var i = 0; i < array_length(monsters); i++)
					{
						if (monsters[i] != noone && monsters[i].present && monsters[i].hp > 0)
						{
							for (var j = 0; j < array_length(display); j++)
							{
								if (display[j] == noone)
								{
									display[j] = monsters[i];
									display_length++;
									break;
								}
							}
						}
					}
					break;
				}
				case BUTTON.MERCY: // If act is selected check for all monsters which are alive and have not been spared and display them in a list
				{
					var _spareable = false
					with(par_monster)
					{
						if (spareable)
						{
							_spareable = true;
						}
					}
					mercy[0] = string_to_array(convert_string(((_spareable) ? S_YELLOW : S_WHITE) + "Spare", (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25) - 3));
					selected_option = 0;
					draw_type = GUI_DRAW.MERCY;
					break;
				}
			}
			break;
		}
		case HIEARCHY.BUTTON_ACTION: // If the variable is for the actions of the ui buttons 
		{
			switch (selected_button)
			{
				case BUTTON.FIGHT: // When a monster is selected on the fight options, display the meter and set the target
				{
					target = display[selected_option];
					draw_type = GUI_DRAW.METER;
					
					text_page = 0;
					break;
				}
				case BUTTON.ACT: // When a monster is selected on the fight options, display the meter and set the target
				{
					target = display[selected_option];
					draw_type = GUI_DRAW.ACT_TEXT;
					break;
				}
				case BUTTON.MERCY:
				{
					switch (selected_option)
					{
						case 0:
						{
							var _ge = 0;
							var _continue_fight = false;
							with (par_monster)
							{
								if (spareable)
								{
									spare_monster();
									_ge += gold_worth;
								}
								if (present)
								{
									_continue_fight = true;
								}
							}
							gold_earned += _ge;
							if (_continue_fight)
							{
								set_hiearchy(HIEARCHY.MONSTER_SPEECH);
							}
							else
							{
								set_hiearchy(HIEARCHY.BATTLE_WON);
							}
							break;
						}
						case 1:
						{
							typewriter_reset();
							print = [];
							flee_string = string_to_array(convert_string(flee_text[round(random(2))], (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25)));
							draw_type = GUI_DRAW.WIN_TEXT;
							with (obj_soul)
							{
								sprite_index = spr_flee;
								image_speed = 1;
							}
							break;
						}
					}
					break;
				}
			}
			break;
		}
		case HIEARCHY.BUTTON_RESULT:
		{
			switch (selected_button)
			{
				case BUTTON.FIGHT: // When a monster is selected on the fight options, display the meter and set the target
				{
					break;
				}
				case BUTTON.ACT: // When an act has been chosen send that to the monster object
				{
					l = 0;
					draw_type = GUI_DRAW.FLAVOUR_TEXT;
					text_page = 0;
					with (par_monster)
					{
						recieve = MONSTER_MS.NO_TARGET;
					}
					target.recieve = selected_act;
					target.act_count[selected_act]++;
					break;
				}
			}
			break;
		}
		case HIEARCHY.MONSTER_SPEECH:
		{
			draw_type = GUI_DRAW.NONE;
			with (par_monster)
			{
				text_bubble = true;
			}
			break;
		}
		case HIEARCHY.BATTLE_WON:
		{
			selected_button = -1;
			draw_type = GUI_DRAW.WIN_TEXT;
			l = 0;
			win_text = S_WHITE + "YOU WON!#You earned " + string(xp_earned) + " EXP and " + string(gold_earned) + "G."
								
			if (xp_earned + global.xp > global.xp_required[global.lv])
			{
				win_text += "#Your LOVE increased";
				var cur_xp = global.xp;
				var temp_earned = xp_earned;
				while(temp_earned + cur_xp > global.xp_required[global.lv])
				{
					global.lv++;
					show_debug_message(global.lv);
					var prev_xp = cur_xp;
					cur_xp = global.xp_required[global.lv];
					temp_earned -= cur_xp - prev_xp;
				}
				update_stats();
				audio_play_sound(sfx_levelup, 100, false);
			}
			break;
		}
	}
}

/// @function set_hiearchy(hiearchy_id)
function set_hiearchy(_set)
{
	change_hiearchy(_set - hiearchy);
}

function spare_monster()
{
	present = false;
	for (var i = 0; i < random_range(6, 12); i++)
	{
		var bb_width = bbox_right - bbox_left;
		var bb_height = bbox_bottom - bbox_top;
		instance_create_depth(random_range(bbox_left + bb_width/3, bbox_right - bb_width/3), random_range(bbox_top + bb_height/3, bbox_bottom - bb_height/3), depth - 1, obj_smoke);
	}
	audio_play_sound(sfx_kill, 100, false);
}