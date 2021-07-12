/// @description ?
if (instance_exists(monster))
{
	draw_set_color(c_red);
	draw_rectangle(x - monster.max_hp/2, y-12, x +  monster.max_hp/2, y + 12, false);
	if (monster.display_hp > 0)
	{
		draw_set_color(c_lime);
		draw_rectangle(x - monster.max_hp/2, y-12, (x - monster.max_hp/2) + monster.display_hp, y + 12, false);
	}
}

if (damage > 0)
{
	draw_set_color(c_red);
}
else if (damage < 0)
{
	draw_set_color(c_green);
}
else
{
	draw_set_color(c_grey);
}

draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(FNT_ATTACK);
draw_text(x, y + text_y, string(damage));
