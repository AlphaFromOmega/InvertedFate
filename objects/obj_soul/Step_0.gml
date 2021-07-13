/// @description Location
scr_controls();
switch (obj_battle.hierarchy)
{
	case HIERARCHY.MONSTER_SPEECH: case HIERARCHY.DISABLED:
	{
		spd = (keyboard_check(ord("X"))) ? small_spd : main_spd;
		x += spd * hdir;
		y += spd * vdir;
		x = clamp(x,BB.ui9slice_x1 + 14, BB.ui9slice_x2 - 14);
		y = clamp(y,BB.ui9slice_y1 + 14, BB.ui9slice_y2 - 14);
		break;
	}
	case HIERARCHY.ACTION_BUTTONS:
	{
		x = 17 + GUI_BATTLE_MARGIN_W + (obj_battle.selected_button * (sprite_get_width(spr_ui_battle_act) +  obj_battle.button_seperation));
		y = display_get_gui_height() - (sprite_get_height(spr_ui_battle_act)/2 + GUI_BATTLE_MARGIN_H);
		break;
	}
	case HIERARCHY.UI_BUTTONS:
	{
		switch (obj_battle.selected_button)
		{
			case 0: case 1: case 3:
			{
				x = BATTLE.textbox_x1 + GUI_MARGIN * 1.25 + 16;
				y = BATTLE.textbox_y1 + (BATTLE.textbox_y2 - BATTLE.textbox_y1)/2 - string_height("A") * 3/2 + string_height("A") * BATTLE.selected_option + 16;
				break;
			}
			case 2:
			{
				x = room_width/2 + (BATTLE.selected_option - 3.5) * 32
				y = BATTLE.textbox_y1 + (BATTLE.textbox_y2 - BATTLE.textbox_y1)/2 - string_height("A") * 3/2 + string_height("A") * 2 + 16;
				break;
			}
		}
		break;
	}
	case HIERARCHY.BUTTON_ACTION:
	{
		switch (obj_battle.selected_button)
		{
			case BUTTON.ACT:
			{
				x = BATTLE.textbox_x1 + ((BATTLE.selected_act % 2) ? (BATTLE.textbox_x2 - BATTLE.textbox_x1)/2 : GUI_MARGIN * 1.25) + 16;
				y = BATTLE.textbox_y1 + (BATTLE.textbox_y2 - BATTLE.textbox_y1)/2 - string_height("A") * 3/2 + string_height("A") * BATTLE.selected_act div 2 + 16;
				break;
			}
			case BUTTON.ITEM:
			{
				x = 17 + GUI_BATTLE_MARGIN_W + (obj_battle.selected_button * (sprite_get_width(spr_ui_battle_act) +  obj_battle.button_seperation));
				y = display_get_gui_height() - (sprite_get_height(spr_ui_battle_act)/2 + GUI_BATTLE_MARGIN_H);
				break;
			}
			case BUTTON.MERCY:
			{
				if (BATTLE.selected_option == 1)
				{
					x -= 1;
				}
			}
		}
		break;
	}
	case HIERARCHY.BUTTON_RESULT:
	{
		x = 17 + GUI_BATTLE_MARGIN_W + (obj_battle.selected_button * (sprite_get_width(spr_ui_battle_act) +  obj_battle.button_seperation));
		y = display_get_gui_height() - (sprite_get_height(spr_ui_battle_act)/2 + GUI_BATTLE_MARGIN_H);
		break;
	}
}

if (inv > 0)
{
	inv--;
}