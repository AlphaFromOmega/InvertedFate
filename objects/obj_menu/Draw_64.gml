/// @description ?
draw_set_font(fnt_deter_sans);

// Menu select
draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 16, display_get_gui_height()/2 - 74, 142, 148, image_angle, image_blend, image_alpha);

draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var t_l = (array_length(menu) - 1);
for (var i = 0; i < array_length(menu); i++;)
{
	draw_text(GUI_MARGIN_H + 64, display_get_gui_height()/2 - (t_l * 16) + 32 * i, menu[i]);
}

draw_sprite(spr_battle_soul_red, 0, GUI_MARGIN_H + 44, display_get_gui_height()/2 - (t_l * 16) + 32 * selected)

// Small stats window
draw_sprite_pscaled(spr_UI_box, 0, GUI_MARGIN_H + 16, stats_y, 142, 110, image_angle, image_blend, image_alpha);

draw_set_valign(fa_top);
draw_text(GUI_MARGIN_H + 32, stats_y + 9, string(global.name));

draw_set_font(fnt_smallstats);
draw_text(GUI_MARGIN_H + 32, stats_y + 48, "LV");
draw_text(GUI_MARGIN_H + 50 + string_width("LV"), stats_y + 48, string(global.lv));

draw_text(GUI_MARGIN_H + 32, stats_y + 66, "HP");
draw_text(GUI_MARGIN_H + 50 + string_width("HP"), stats_y + 66, string(global.hp) + "/" + string(global.max_hp));

draw_text(GUI_MARGIN_H + 32, stats_y + 84, "G");
draw_text(GUI_MARGIN_H + 50 + string_width("G "), stats_y + 84, string(global.gold));

