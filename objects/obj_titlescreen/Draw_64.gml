/// @description ?
if (file_exists("save.dtr"))
{
	draw_set_color(c_white);
	draw_set_font(fnt_deter_sans);
	draw_set_halign(fa_left);
	draw_text(140, 128, chara_name);
	draw_text(280, 128, "LV " + string(lv));
	
	draw_text(140, 168, saved_name);
	
	draw_set_halign(fa_right);
	draw_text(500, 128, string(time div 60) + ":" + ((time % 60 < 10) ? "0" : "") + string(time % 60));
	
	draw_set_halign(fa_left);
	for (var i = 0; i < array_length(text); i++;)
	{
		draw_set_color((selected == i) ? c_yellow : c_white)
		draw_text(text_x[i], text_y[i], text[i]);
	}	
	
}
else
{
	draw_set_color(c_gray);
	draw_set_font(fnt_deter_sans);
	draw_set_halign(fa_left);
	
	draw_text(170, 40, " ---Instruction--");
	draw_text(170, 100, "[Z or ENTER] - Confirm \n[X or SHIFT] - Cancel \n[C or CTRL] - Menu (In-game) \n[F4] Fullscreen \nHold ESC - Quit \nWhen your HP is low, you lose");
	
	for (var i = 0; i < array_length(i_text); i++;)
	{
		draw_set_color((selected == i) ? c_yellow : c_white)
		draw_text(170, 335 + 40 * i, i_text[i]);
	}	
}
draw_set_color(c_gray);
draw_set_font(fnt_smallstats)
draw_set_halign(fa_center);
draw_text(display_get_gui_width()/2, 464, "Undertale? VX.00X (C) ASRIEL DREEMURR 2015");