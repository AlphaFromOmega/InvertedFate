/// @description Insert description here
// You can write your code in this editor
var _hdir, _vdir;

lerp_prog += (1 - lerp_prog) / 50;

ui9slice_x1 = lerp(ui9slice_x1, destined_x1, lerp_prog);
ui9slice_y1 = lerp(ui9slice_y1, destined_y1, lerp_prog);
ui9slice_x2 = lerp(ui9slice_x2, destined_x2, lerp_prog);
ui9slice_y2 = lerp(ui9slice_y2, destined_y2, lerp_prog);

_hdir = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
_vdir = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if ((keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X"))) && hiearchy != HIEARCHY.DISABLED && draw_type != GUI_DRAW.METER)
{
	var change = keyboard_check_pressed(ord("Z")) - keyboard_check_pressed(ord("X"));
	switch (hiearchy)
	{
		case HIEARCHY.BUTTON_RESULT:
		{
			if (selected_button == BUTTON.ACT && change > 0)
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
						set_hiearchy(HIEARCHY.MONSTER_SPEECH);
					}
				}
			}
			else
			{
				set_hiearchy(HIEARCHY.DISABLED);
			}
			break;
		}
		case HIEARCHY.MONSTER_SPEECH:
		{
			set_hiearchy(HIEARCHY.DISABLED);
			break;
		}
		case HIEARCHY.BATTLE_WON:
		{
			if (change > 0)
			{
				global.xp += xp_earned;
				global.gold += gold_earned;
				room_goto(rm_test);
			}
			break;
		}
		default:
		{
			audio_play_sound(sfx_select, 100, false);
			change_hiearchy(change);
		}
	}
}
switch (hiearchy)
{
	case HIEARCHY.DISABLED: // Just a seperate case for disabled (incase of defaults)
	{
		break;
	}
	case HIEARCHY.ACTION_BUTTONS:
	{
		if (ui9slice_x1 == textbox_x1)
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
	case HIEARCHY.UI_BUTTONS:
	{
		switch (selected_button)
		{
			case 0:
			{	
				var _last = selected_monster;
				selected_monster += _hdir + _vdir;
				if (selected_monster < 0)
				{
					selected_monster = display_length - 1;
				}
				if (selected_monster >= display_length)
				{
					selected_monster = 0;
				}
				if (_last != selected_monster)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
			case 1:
			{
				var _last = selected_monster;
				selected_monster += _hdir + _vdir;
				if (selected_monster < 0)
				{
					selected_monster = display_length - 1;
				}
				if (selected_monster >= display_length)
				{
					selected_monster = 0;
				}
				if (_last != selected_monster)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				break;
			}
		}
		break;
	}
	case HIEARCHY.BUTTON_ACTION:
	{
		switch (selected_button)
		{
			case BUTTON.FIGHT:
			{
				if (spawned < spawn_max) // If bars do not excceed the max
				{
					if (barmake == 0) // Check if the bar timer is 0
					{
						// Create attack bars
						var _create = noone
						if (instance_exists(obj_attackbar) || instance_exists(obj_attackbarcharge))
						{
							_create = instance_create_depth(ui9slice_x1, ui9slice_y1 + ((ui9slice_y2 - ui9slice_y1)/2), depth - 1, obj_attackbarcharge);
						}
						else
						{
							_create = instance_create_depth(ui9slice_x1, ui9slice_y1 + ((ui9slice_y2 - ui9slice_y1)/2), depth - 1, obj_attackbar);
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
									if (hp > 0)
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
									set_hiearchy(HIEARCHY.MONSTER_SPEECH);
								}
								else
								{
									// Player has won
									set_hiearchy(HIEARCHY.BATTLE_WON);
								}
							}
						}
						else
						{
							var _damage = 0
							for (var i = 0; i < spawn_max; i++)
							{
								if (attack_accuracy[i] == -1)
								{
									continue;
								}
								_damage += (1 - attack_accuracy[i]);
							}
							_damage = _damage/spawn_max;
							_damage *= atk;
							_damage = round(_damage);
							var _dmgtext = instance_create_depth(target.x, target.y, target.depth - 1, obj_dmgtext);
							_dmgtext.damage = _damage
							_dmgtext.monster = target;
							
							target.hit = 30;
							target.hp -= _damage;
						}
					}
				}
				break;
			}
			case BUTTON.ACT:
			{
				var _last = selected_act;
				selected_act += _hdir + _vdir * 2;
				if (selected_act < 0)
				{
					selected_act = display_length - (1 - (_vdir * abs((display_length % 2) - abs((selected_act - 1) % 2))));
				}
				if (selected_act >= display_length)
				{
					selected_act = _vdir * (selected_act % 2);
				}
				if (_last != selected_act)
				{
					audio_play_sound(sfx_switch, 2, false);
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
			case BUTTON.FIGHT:
			{
				// Attack
			}
			case BUTTON.ACT:
			{
				print = typewriter(target.act_result[selected_act][text_page], 30, sfx_voice_generic);
				break;
			}
		}
		break;
	}
	case HIEARCHY.BATTLE_WON:
	{
		global.hp = global.hp;
		if (ui9slice_x1 == textbox_x1)
		{
			var _str = string_to_array(convert_string(win_text, (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25)))
			print = typewriter(_str, 30, sfx_voice_generic);
		}
		break;
	}
}