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

if (((keyboard_check_pressed(ord("Z")) && hiearchy > -1) || (keyboard_check_pressed(ord("X")) && hiearchy > 0)) && !(draw_type == GUI_DRAW.METER))
{
	if (hiearchy == HIEARCHY.BATTLE_WON) // On battle won return to overworld
	{
		global.xp += xp_earned;
		global.gold += gold_earned;
		room_goto(rm_test);
	}
	else // Else reset printing method and change hierchy
	{
		l = 0;
		print = "";
		hiearchy += keyboard_check_pressed(ord("Z")) - keyboard_check_pressed(ord("X"));
		audio_play_sound(sfx_select, 1, false);
		switch (hiearchy)
		{
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
				}
				break;
			}
			case HIEARCHY.BUTTON_ACTION: // If the variable is for the actions of the ui buttons 
			{
				switch (selected_button)
				{
					case BUTTON.FIGHT: // When a monster is selected on the fight options, display the meter and set the target
					{
						target = display[selected_monster];
						draw_type = GUI_DRAW.METER;
					}
				}
				break;
			}
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
			l += 30;
			print = string_copy(str, 1, custom_text_length(str, l/room_speed));
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
				/* 2 Wide selection
				var _last = selected_monster;
				selected_monster += _hdir + _vdir * 2;
				if (selected_monster < 0)
				{
					selected_monster = display_length - (1 - (_vdir * abs((display_length % 2) - abs((selected_monster - 1) % 2))));
				}
				if (selected_monster >= display_length)
				{
					selected_monster = _vdir * (selected_monster % 2);
				}
				if (_last != selected_monster)
				{
					audio_play_sound(sfx_switch, 2, false);
				}
				*/
				
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
			case 0:
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
									hiearchy = HIEARCHY.DISABLED;
									instance_create_depth(0, 0, 0, pat_debug_bone);
								}
								else
								{
									// Player has won
									selected_button = -1;
									draw_type = GUI_DRAW.WIN_TEXT;
									hiearchy = HIEARCHY.BATTLE_WON;
									l = 0;
									
									win_text = "* YOU WON! \n* You earned " + string(xp_earned) + " EXP and " + string(gold_earned) + "G."
									if (xp_earned + global.xp > global.xp_required[global.lv])
									{
										win_text += "\n* Your LOVE increased";
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
		}
		break;
	}
	case HIEARCHY.BATTLE_WON:
	{
		global.hp = global.hp;
		if (ui9slice_x1 == textbox_x1)
		{
			l += 30;
			print = string_copy(win_text, 1, custom_text_length(win_text, l/room_speed));
		}
		break;
	}
}