/// @description ?
if (blackout)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_color(c_white);
	draw_sprite(spr_battle_soul_red, 0, (x - view_x) * 2, (y - view_y) * 2);
}