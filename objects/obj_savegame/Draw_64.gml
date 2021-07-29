/// @description ?
draw_set_color(c_white)
draw_sprite_pscaled(spr_UI_box, 0, textbox_x, textbox_y, 424, 174, 0, c_white, 1);

draw_set_color(saved ? c_yellow : c_white)
draw_set_halign(fa_left);
draw_set_font(fnt_deter_sans);
draw_text(textbox_x + 30, textbox_y + 23, chara_name);
draw_text(textbox_x + 30, textbox_y + 63, saved_name);
draw_text(textbox_x + 170, textbox_y + 23, "LV " + string(lv));

draw_set_halign(fa_right);
draw_text(textbox_x + 392, textbox_y + 23, string(time div 60) + ":" + ((time % 60 < 10) ? "0" : "") + string(time % 60));

draw_set_halign(fa_left);
if (saved)
{
	draw_text(textbox_x + 60, textbox_y + 123, "File Saved");
}
else
{
	for (var i = 0; i < array_length(text); i++)
	{
		if (selected == i)
		{
			draw_sprite(spr_soul_menu, 0, textbox_x + 42 + 180 * i, textbox_y + 139);
		}
		draw_text(textbox_x + 60 + 180 * i, textbox_y + 123, text[i]);
	}
}