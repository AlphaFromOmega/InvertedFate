/// @description ?
draw_set_font(fnt_deter_sans);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_ext_transformed(display_get_gui_width()/2, 22, "SETTINGS", 0, 128, 2, 2, 0);
draw_set_halign(fa_left);
for (var i = 0; i < array_length(text); i++;)
{
	draw_set_color((selected == i) ? c_yellow : c_white);
	if (!gamepad_is_connected(0) && i == 2)
	{
		draw_set_color(c_gray);
	}
	var _y = i * (60 - ((i > 2) * 10)) + (i > 2) * 128;
	draw_text(40, 80 + _y, text[i]);
}

draw_set_color(!gamepad_is_connected(0) ? c_gray : c_white);

for (var i = 0; i < array_length(bc_text); i++;)
{
	if (button_config)
	{
		draw_set_color((selected == i) ? c_yellow : c_white);
	}
	if (!gamepad_is_connected(0))
	{
		draw_set_color(c_gray);
	}
	var _y = i * 36;
	draw_text(80, 236 + _y, bc_text[i]);
}