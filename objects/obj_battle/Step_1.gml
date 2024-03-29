/// @description Insert description here
// You can write your code in this editor
var _hdir, _vdir;

_hdir = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
_vdir = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if ((keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X"))) && hierarchy != HIERARCHY.DISABLED && draw_type != GUI_DRAW.METER)
{
	var change = keyboard_check_pressed(ord("Z")) - keyboard_check_pressed(ord("X"));
	
	if (hierarchy + change < 0)
	{
		change = 0;
	}
	if (change != 0)
	{
		switch (hierarchy)
		{
			case HIERARCHY.BUTTON_ACTION:
			{
				switch (selected_button)
				{
					case BATTLE_BUTTON.ITEM:
					{
						if (change > 0)
						{
							if (array_length(print) == array_length(item.array_use_string[text_page]))
							{
								typewriter_reset();
								print = [];
								if (array_length(item.array_use_string) - 1 > text_page)
								{
									text_page++;
								}
								else
								{
									set_hierarchy(HIERARCHY.MONSTER_SPEECH);
								}
							}
						}
						break;
					}
					case BATTLE_BUTTON.MERCY:
					{
						room_goto(end_room);
						break;
					}
					default:
					{
						audio_play_sound(sfx_select, 100, false);
						change_hierarchy(change);
						break;
					}
				}
				break;
			}
			case HIERARCHY.BUTTON_RESULT:
			{
				if (selected_button == BATTLE_BUTTON.ACT)
				{
					if (change > 0)
					{
						if (array_length(print) == array_length(target.act_result[selected_act][text_page]))
						{
							typewriter_reset();
							print = [];
							if (array_length(target.act_result[selected_act]) - 1 > text_page)
							{
								text_page++;
							}
							else
							{
								set_hierarchy(HIERARCHY.MONSTER_SPEECH);
							}
						}
					}
				}
				else
				{
					set_hierarchy(HIERARCHY.DISABLED);
				}
				break;
			}
			case HIERARCHY.MONSTER_SPEECH:
			{
				set_hierarchy(HIERARCHY.DISABLED);
				break;
			}
			case HIERARCHY.BATTLE_WON:
			{
				if (change > 0)
				{
					global.xp += xp_earned;
					global.gold += gold_earned;
					room_goto(end_room);
				}
				break;
			}
			default:
			{
				audio_play_sound(sfx_select, 100, false);
				change_hierarchy(change);
			}
		}
	}
}
switch (hierarchy)
{
	case HIERARCHY.DISABLED: // Just a seperate case for disabled (incase of defaults)
	{
		break;
	}
	case HIERARCHY.ACTION_BUTTONS:
	{
		if (BB.ui9slice_x1 == textbox_x1)
		{
			print = typewriter(str, 30, sfx_voice_generic);
		}
		if (keyboard_check_pressed(vk_left))
		{
			selected_button--;
			if (selected_button < 0)
			{
				selected_button = 3;
			}
			audio_play_sound(sfx_switch, 2, false);
		}
		if (keyboard_check_pressed(vk_right))
		{
			selected_button++;
			if (selected_button > 3)
			{
				selected_button = 0;
			}
			audio_play_sound(sfx_switch, 2, false);
		}
		break;
	}
	case HIERARCHY.UI_BUTTONS:
	{
		switch (selected_button)
		{
			case 0:
			{	
				var _last = selected_option;
				selected_option += _hdir + _vdir;
				if (selected_option < 0)
				{
					selected_option = display_length - 1;
				}
				if (selected_option >= display_length)
				{
					selected_option = 0;
				}
				if (_last != selected_option)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
			case 1:
			{
				var _last = selected_option;
				selected_option += _hdir + _vdir;
				if (selected_option < 0)
				{
					selected_option = display_length - 1;
				}
				if (selected_option >= display_length)
				{
					selected_option = 0;
				}
				if (_last != selected_option)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
			case 2:
			{
				var _last = selected_option;
				selected_option += _hdir + _vdir;
				var _options = 8
				if (selected_option < 0)
				{
					selected_option = _options - 1;
				}
				if (selected_option >= _options)
				{
					selected_option = 0;
				}
				if (_last != selected_option)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
			case 3:
			{
				var _last = selected_option;
				selected_option += _hdir + _vdir;
				var _options = 1 + fleeable
				if (selected_option < 0)
				{
					selected_option = _options - 1;
				}
				if (selected_option >= _options)
				{
					selected_option = 0;
				}
				if (_last != selected_option)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
		}
		break;
	}
	case HIERARCHY.BUTTON_ACTION:
	{
		switch (selected_button)
		{
			case BATTLE_BUTTON.FIGHT:
			{
				if (spawned < global.weapon_amount) // If bars do not excceed the max
				{
					if (barmake == 0) // Check if the bar timer is 0
					{
						// Create attack bars
						var _create = noone
						if (instance_exists(obj_attackbar) || instance_exists(obj_attackbarcharge))
						{
							_create = instance_create_depth(BB.ui9slice_x1, BB.ui9slice_y1 + ((BB.ui9slice_y2 - BB.ui9slice_y1)/2), depth - 1, obj_attackbarcharge);
						}
						else
						{
							_create = instance_create_depth(BB.ui9slice_x1, BB.ui9slice_y1 + ((BB.ui9slice_y2 - BB.ui9slice_y1)/2), depth - 1, obj_attackbar);
						}
						if (_create != noone)
						{
							_create.num = spawned;
							spawned++;
						}
						barmake = 5 + round(random(15));
					}
					else 
					{
						//Countdown
						barmake--
					}
				}
				else
				{
					if (!instance_exists(obj_anybar)) // If no bars exist
					{
						// deal damage, begin monster turn
						if (instance_exists(obj_dmgtext))
						{
							if (obj_dmgtext.vsp == 0)
							{
								instance_destroy(obj_dmgtext);
								draw_type = GUI_DRAW.NONE;
								
								var monster_count = 0;
								with (par_monster)
								{
									if (hp > 0 && present)
									{
										monster_count++;
									}
								}
								if (target.hp == 0)
								{
									xp_earned += target.xp_worth;
									gold_earned += target.gold_worth;
								}
								if (monster_count > 0)
								{
									// Start enemy turn
									with (par_monster)
									{
										recieve = MONSTER_MS.NO_TARGET;
									}
									target.recieve = MONSTER_MS.ATTACKED;
									set_hierarchy(HIERARCHY.MONSTER_SPEECH);
								}
								else
								{
									// Player has won
									set_hierarchy(HIERARCHY.BATTLE_WON);
								}
							}
						}
					}
				}
				break;
			}
			case BATTLE_BUTTON.ACT:
			{
				var _last = selected_act;
				var _acts = array_length(target.act_result)
				
				selected_act += _hdir + _vdir * 2;
				if (selected_act < 0)
				{
					selected_act = _acts - (1 - (_vdir * abs((_acts  % 2) - abs((selected_act - 1) % 2))));
				}
				if (selected_act >= _acts)
				{
					selected_act = _vdir * (selected_act % 2);
				}
				if (_last != selected_act)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
			case BATTLE_BUTTON.ITEM:
			{
				print = typewriter(item.array_use_string[text_page], 30, sfx_voice_generic);
				break;
			}
			case BATTLE_BUTTON.MERCY:
			{
				print = typewriter(flee_string, 30, sfx_voice_generic);
				if (obj_soul.x < -16)
				{
					room_goto(end_room);
				}
				break;
			}
		}
		break;
	}
	case HIERARCHY.BUTTON_RESULT:
	{
		switch (selected_button)
		{
			case BATTLE_BUTTON.FIGHT:
			{
				// Attack
			}
			case BATTLE_BUTTON.ACT:
			{
				print = typewriter(target.act_result[selected_act][text_page], 30, sfx_voice_generic);
				break;
			}
		}
		break;
	}
	case HIERARCHY.BATTLE_WON:
	{
		global.hp = global.hp;
		if (BB.ui9slice_x1 == textbox_x1)
		{
			var _str = string_to_array(convert_string(win_text, (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25)))
			print = typewriter(_str, 30, sfx_voice_generic);
		}
		break;
	}
}
if (global.hp <= 0 && !timeline_running)
{
	instance_destroy(par_attack);
	instance_destroy(par_monster);
	instance_destroy(par_pattern);
	
	timeline_index = tml_die;
	timeline_position = 0;
	timeline_running = true;
}