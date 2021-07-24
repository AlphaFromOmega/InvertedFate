/// @description ?
if (dl)
{
	draw_set_color(((time div 2) % 2) ? c_yellow : c_red);
	draw_line(x, y, x + lengthdir_x(1000, direction), y + lengthdir_y(1000, direction));
}