/// @description ?
draw_set_alpha(1);
if (global.weapon_style == WEAPON_STYLE.MULTI)
{
	if (num % 2)
	{
		draw_set_color(c_orange);
	}
	else
	{
		draw_set_color(c_aqua);
	}
	draw_set_alpha(alpha);
	draw_rectangle(x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2, false)
}
else
{
	draw_self();
}
draw_set_alpha(1);
