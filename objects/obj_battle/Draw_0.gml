/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_sprite_pscaled(spr_UI_box, 0, ui9slice_x1, ui9slice_y1, ui9slice_x2 - ui9slice_x1, ui9slice_y2 - ui9slice_y1, 0, c_white, 1);

for (var i = 0; i < 4; i++)
{
	draw_sprite(button[i], (selected_button == i && hiearchy != 2 && hiearchy != -1) ? 1 : 0, GUI_BATTLE_MARGIN_W + i * (sprite_get_width(button[0]) + button_seperation), display_get_gui_height() - GUI_BATTLE_MARGIN_H);
}
// Draw Name and Level
draw_set_font(fnt_info);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_text(textbox_x1 + 4, textbox_y2 + (infobar_bottom - textbox_y2) / 2, global.name);
draw_text(textbox_x1 + 4 + string_width(string(global.name) + "W"), textbox_y2 + (infobar_bottom - textbox_y2) / 2, "LV " + string(global.lv));

// global.hp + Status Effects
draw_sprite(spr_ui_battle_hp, 0, display_get_gui_width()/2 - 60, textbox_y2 + (infobar_bottom - textbox_y2) / 2);
draw_rectangle_color(display_get_gui_width()/2 - 45, textbox_y2 + 10, infobar_health + floor(((12 * global.max_hp) + 10)/10), infobar_bottom - 10, c_red, c_red, c_red, c_red, false);
draw_rectangle_color(display_get_gui_width()/2 - 45, textbox_y2 + 10, infobar_health + floor(((12 * global.hp) + 10)/10), infobar_bottom - 10, c_yellow, c_yellow, c_yellow, c_yellow, false);
draw_text(infobar_health + floor(((12 * max(global.max_hp, global.hp)) + 10)/10) + 15, textbox_y2 + (infobar_bottom - textbox_y2) / 2, string(global.hp) + " / " + string(global.max_hp));

// Draw Text
draw_set_font(fnt_textbox);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
switch (draw_type)
{
	case GUI_DRAW.FLAVOUR_TEXT: case GUI_DRAW.WIN_TEXT:
	{
		draw_text_custom(textbox_x1 + GUI_MARGIN * 1.5, textbox_y1 + GUI_MARGIN * 1.25, print, 1);
		break;
	}
	case GUI_DRAW.MONSTERS:
	{
		for (var i = 0; i < display_length; i++)
		{
			if (instance_exists(display[i]))
			{
				var x_dis = textbox_x1 + GUI_MARGIN * 1.5 + string_width("  ");
				var y_dis = textbox_y1 + GUI_MARGIN * 1.25 + 30 * i
				draw_text(x_dis, y_dis, string(display[i].monster_name));
				draw_set_color(c_red);
				draw_rectangle(x_dis + string_width(display[i].monster_name) + 32, y_dis + 8, x_dis + string_width(display[i].monster_name) + 32 + 128, y_dis + 24, false);
				draw_set_color(c_lime);
				draw_rectangle(x_dis + string_width(display[i].monster_name) + 32, y_dis + 8, x_dis + string_width(display[i].monster_name) + 32 + 128 * (display[i].hp / display[i].max_hp), y_dis + 24, false);
				draw_set_color(c_white);
			}
		}
		break;
	}
	case GUI_DRAW.METER:
	{
		draw_sprite(spr_ui_battle_meter, 0, ui9slice_x1 + (ui9slice_x2 - ui9slice_x1)/2, ui9slice_y1 + (ui9slice_y2 - ui9slice_y1)/2)
		break;
	}
}