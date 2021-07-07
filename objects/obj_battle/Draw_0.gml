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
	default:
	{
		break;
	}
	case GUI_DRAW.FLAVOUR_TEXT: case GUI_DRAW.WIN_TEXT:
	{
		if (textbox_x1 == ui9slice_x1)
		{
			var x_dis = textbox_x1 + GUI_MARGIN;
			var y_dis = textbox_y1 + (textbox_y2 - textbox_y1)/2 - string_height("A") * 3/2;
			draw_text_special(x_dis, y_dis, print, 0);
		}
		break;
	}
	case GUI_DRAW.MONSTERS:
	{
		for (var i = 0; i < display_length; i++)
		{
			if (instance_exists(display[i]))
			{
				var x_dis = textbox_x1 + GUI_MARGIN * 1.25 + string_width("  ");
				var y_dis = textbox_y1 + (textbox_y2 - textbox_y1)/2 - string_height("A") * 3/2 + string_height("A") * i
				draw_text_special(x_dis, y_dis, display[i].array_name, 0);
				var _mn = "* " + display[i].monster_name;
				if (selected_button == 0)
				{
					var _x = max(string_width(_mn) + x_dis + 32, display_get_gui_width()/2);
					draw_set_color(c_red);
					draw_rectangle(_x, y_dis + 5, _x + 90, y_dis + 25, false);
					draw_set_color(c_lime);
					draw_rectangle(_x, y_dis + 5, _x + 90 * (display[i].hp / display[i].max_hp), y_dis + 25, false);
					draw_set_color(c_white);
				}
			}
		}
		break;
	}
	case GUI_DRAW.ACT_TEXT:
	{
		show_debug_message("A")
		for (var i = 0; i < array_length(target.act); i++)
		{
			var x_dis = textbox_x1 + ((i % 2) ? (textbox_x2 - textbox_x1)/2 + string_width("  ") : GUI_MARGIN * 1.25 + string_width("  "));
			var y_dis = textbox_y1 + (textbox_y2 - textbox_y1)/2 - string_height("A") * 3/2 + string_height("A") * i div 2;
			draw_text_special(x_dis, y_dis, target.act[i], 0);
		}
		break;
	}
	case GUI_DRAW.METER:
	{
		draw_sprite(spr_ui_battle_meter, 0, ui9slice_x1 + (ui9slice_x2 - ui9slice_x1)/2, ui9slice_y1 + (ui9slice_y2 - ui9slice_y1)/2)
		break;
	}
}