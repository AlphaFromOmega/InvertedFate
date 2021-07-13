/// @description ?
if (BB.lerp_prog > 0.5)
{
	draw_self();
	draw_set_color(c_black);

	draw_set_font(fnt_textbubble);
	draw_set_halign(fa_left);
	draw_text_special(bbox_left, bbox_top, print, 0);
}