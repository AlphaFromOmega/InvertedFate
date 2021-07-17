/// @description ?
draw_set_font(fnt_deter_sans);

// Menu select
draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 16, display_get_gui_height()/2 - 74, 142, 148, image_angle, image_blend, image_alpha);

draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var t_l = (array_length(menu) - 1);
var m_offset = (array_length(menu) < 3) ? 16 : 0;
for (var i = 0; i < array_length(menu); i++;)
{
	draw_set_color((disabled[i] ? c_gray : c_white));
	draw_text(GUI_MARGIN_H + 64, display_get_gui_height()/2 - (t_l * 16) + (32 * i) - m_offset, menu[i]);
}

// Draw menu
if (hierarchy > 0)
{
	var side_margin = GUI_MARGIN_H + 200;
	var top_margin = 53;
	switch (selected_menu)
	{
		case 0:
		{
			draw_set_valign(fa_center);
			draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 172, 52, 346, 362, image_angle, image_blend, image_alpha);
			for (var i = 0; i < INVENTORY.item_count; i++;)
			{
				if (instance_exists(INVENTORY.items[i]))
				{
					draw_text(side_margin + 16, top_margin + 44 + 32 * i, INVENTORY.items[i].item_name);
				}
				else
				{
					sort_items();
				}
			}
				
			draw_text(side_margin + 16, top_margin + 324, "USE");
			draw_text(side_margin + 112, top_margin + 324, "INFO");
			draw_text(side_margin + 226, top_margin + 324, "DROP");
			
			if (hierarchy > 1)
			{
				var s_margin = 0
				switch (selected_option)
				{
					case 0:
					{
						s_margin = -1;
						break;
					}
					case 1:
					{
						s_margin = 96;
						break;
					}
					case 2:
					{
						s_margin = 210;
						break;
					}
				}
				draw_sprite(spr_soul_menu, 0, side_margin + s_margin, top_margin + 324);
			}
			else
			{
				draw_sprite(spr_soul_menu, 0, side_margin - 1, top_margin + 44 + 32 * selected_item);
			}
			
			break;
		}
		case 1:
		{
			draw_set_valign(fa_top);
			draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 172, 52, 346, 418, image_angle, image_blend, image_alpha);
			draw_text(side_margin, top_margin + 32, "\"" + string(global.name) + "\"");
			
			draw_text(side_margin, top_margin + 92, "LV");
			draw_text(side_margin + 12 + string_width("LV"), top_margin + 92, string(global.lv));
			
			draw_text(side_margin, top_margin + 124, "HP")
			draw_text(side_margin + 12 + string_width("HP"), top_margin + 124, string(global.hp) + " / " + string(global.max_hp));
			
			draw_text(side_margin, top_margin + 188, "AT")
			draw_text(side_margin + 12 + string_width("AT"), top_margin + 188, string(global.at) + " (" + string(global.item_at) + ")");
			
			draw_text(side_margin, top_margin + 220, "DF")
			draw_text(side_margin + 12 + string_width("DF"), top_margin + 220, string(global.df) + " (" + string(global.item_df) + ")");

			draw_text(side_margin + 168, top_margin + 188, "EXP: " + string(global.xp));
			draw_text(side_margin + 168, top_margin + 220, "NEXT: " + string(global.xp_required[global.lv] - global.xp));
			
			draw_text(side_margin, top_margin + 280, "WEAPON: " + global.weapon_name);
			draw_text(side_margin, top_margin + 312, "ARMOR: " + global.armour_name);
			
			draw_text(side_margin, top_margin + 352, "GOLD: " + string(global.gold));
			if (global.kills >= 20)
			{
				draw_text(side_margin + 168, top_margin + 352, "KILLS: " + string(global.kills));
			}
			break;
		}
	}
}
else
{
	if (hierarchy > -1)
	{
		draw_sprite(spr_soul_menu, 0, GUI_MARGIN_H + 44, display_get_gui_height()/2 - (t_l * 16) + (32 * selected_menu) - m_offset);
	}
}

// Small stats window
draw_set_valign(fa_top);
draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 16, stats_y, 142, 110, image_angle, image_blend, image_alpha);
draw_text(GUI_MARGIN_H + 32, stats_y + 9, string(global.name));

draw_set_font(fnt_smallstats);
draw_text(GUI_MARGIN_H + 32, stats_y + 48, "LV");
draw_text(GUI_MARGIN_H + 50 + string_width("LV"), stats_y + 48, string(global.lv));

draw_text(GUI_MARGIN_H + 32, stats_y + 66, "HP");
draw_text(GUI_MARGIN_H + 50 + string_width("HP"), stats_y + 66, string(global.hp) + "/" + string(global.max_hp));

draw_text(GUI_MARGIN_H + 32, stats_y + 84, "G");
draw_text(GUI_MARGIN_H + 50 + string_width("G "), stats_y + 84, string(global.gold));

