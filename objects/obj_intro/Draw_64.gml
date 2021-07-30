/// @description ?
draw_set_alpha(fade);
if (page == 0)
{
	draw_sprite_part(spr_intro_00, 0, 0, min(y_location, 473), 400, 220, 120, 60);
}
else
{
	draw_sprite(sprites[page], image_index, 120, 60)
}
if (fade >= 1)
{
	draw_set_font(fnt_textbox)
	draw_text_special(120, 330, print, -1);
}
draw_set_alpha(1);
