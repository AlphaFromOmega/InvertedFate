/// @description ?
if (keyboard_check_pressed(ord("C")) && cd == 0 &&hierarchy > -1)
{
	instance_destroy();
}
var change = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)) + (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up));
switch(hierarchy)
{
	case -1:
	{
		if !(instance_exists(obj_textbox) || instance_exists(obj_textbox_queue))
		{
			instance_destroy();
		}
		break;
	}
	case 0:
	{
		if (change != 0)
		{
			selected_menu += change;
	
			if (selected_menu >= array_length(menu))
			{
				selected_menu = 0;
			}
			if (selected_menu < 0)
			{
				selected_menu = array_length(menu) - 1;
			}
			audio_play_sound(sfx_switch, 100, false);
		}
		if (keyboard_check_pressed(ord("Z")))
		{
			if !(disabled[selected_menu])
			{
				hierarchy++;
			}
			audio_play_sound(sfx_select, 100, false);
		}
		if (keyboard_check_pressed(ord("X")))
		{
			audio_play_sound(sfx_select, 100, false);
			instance_destroy();
		}
		break;
	}
	case 1:
	{
		switch (selected_menu)
		{
			case MENU_BUTTON.ITEM:
			{
				if (change != 0)
				{
					selected_item += change;
	
					if (selected_item >= INVENTORY.item_count)
					{
						selected_item = 0;
					}
					if (selected_item < 0)
					{
						selected_item = INVENTORY.item_count - 1;
					}
					audio_play_sound(sfx_switch, 100, false);
				}
				if (keyboard_check_pressed(ord("Z")))
				{
					hierarchy++;
					audio_play_sound(sfx_select, 100, false);
				}
				break;
			}
			default:
			{
				break;
			}
		}
		if (keyboard_check_pressed(ord("X")))
		{
			audio_play_sound(sfx_select, 100, false);
			hierarchy--;
		}
		break;
	}
	case 2:
	{
		switch (selected_menu)
		{
			case MENU_BUTTON.ITEM:
			{
				if (change != 0)
				{
					selected_option += change;
	
					if (selected_option >= 3)
					{
						selected_option = 0;
					}
					if (selected_option < 0)
					{
						selected_option = 2;
					}
					audio_play_sound(sfx_switch, 100, false);
				}
				if (keyboard_check_pressed(ord("Z")))
				{
					audio_play_sound(sfx_select, 100, false);
					var _s_item = INVENTORY.items[selected_item];
					hierarchy = -1;
					switch (selected_option)
					{
						case 0:
						{
							use_item(_s_item);
							break;
						}
						case 1:
						{
							create_textbox(_s_item.item_name + " - " + _s_item.item_attribute + "#" + _s_item.desc_string, 30, fnt_textbox, noone, sfx_voice_generic);
							break;
						}
						case 2:
						{
							remove_item(_s_item);
							break;
						}
					}
				}
				break;
			}
			default:
			{
				break;
			}
		}
		if (keyboard_check_pressed(ord("X")))
		{
			audio_play_sound(sfx_select, 100, false);
			hierarchy--;
		}
		break;
	}
}
