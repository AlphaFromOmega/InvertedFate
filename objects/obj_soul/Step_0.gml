/// @description Location
scr_controls();
switch (obj_battle.hiearchy)
{
	case -1:
	{
		x += 3 * hdir;
		y += 3 * vdir;
		x = clamp(x,obj_battle.ui9slice_x1 + 14, obj_battle.ui9slice_x2 - 14);
		y = clamp(y,obj_battle.ui9slice_y1 + 14, obj_battle.ui9slice_y2 - 14);
		break;
	}
	case 0:
	{
		x = 17 + GUI_BATTLE_MARGIN_W + (obj_battle.selected_button * (sprite_get_width(spr_ui_battle_act) +  obj_battle.button_seperation));
		y = display_get_gui_height() - (sprite_get_height(spr_ui_battle_act)/2 + GUI_BATTLE_MARGIN_H);
		break;
	}
	case 1:
	{
		switch (obj_battle.selected_button)
		{
			case 0:
			{
				x = obj_battle.textbox_x1 + GUI_MARGIN * 1.5 + 8;
				y = obj_battle.textbox_y1 + GUI_MARGIN * 1.25 + obj_battle.selected_monster * 30 + 16;
				break;
			}
		}
	}
}

if (inv > 0)
{
	inv--;
}