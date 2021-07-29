/// @description ?
draw_set_font(fnt_deter_sans);
draw_set_color(c_white);
draw_set_halign(fa_center);

if (done)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_ext_transformed(display_get_gui_width()/2 + jitter(0.75, 1), lerp(130,250, lrp) + jitter(0.75, 1), player_name, 0, 1024, 1 + lrp * 2, 1 + lrp * 2, jitter(1, 2));
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(180, 60, text, 32, 280);
	
	for (var i = 0; i < 2; i++;)
	{
		draw_set_color(cursor_x == i ? c_yellow : c_white);
		switch (i)
		{
			case 0:
			{
				if (changeable)
				{
					if (allowed)
					{
						draw_text(150, 400, "No");
					}
					else
					{
						draw_text(150, 400, "Go Back");
					}
				}
				break;
			}
			case 1:
			{
				if (allowed)
				{
					draw_text(460, 400, "Yes")
				}
				break;
			}
		}
	}
}
else
{
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, 60, "Name the fallen human");
	draw_set_valign(fa_center);
	draw_text(display_get_gui_width()/2, 120, player_name);

	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	for (var i = 0; i < 7; i++)
	{
		for (var j = 0; j < 8; j++)
		{
			draw_set_color(cursor_x == i && cursor_y == j ? c_yellow : c_white);
			var text_y = 28 * j + ((j > 3) ? 8 : 0);
			draw_text(120 + jitter(0.2, 1) + i * 64, 151 + jitter(0.2, 1) + text_y, total_case[i][j]);
		}
	}

	draw_set_halign(fa_left);
	for (var i = 0; i < 3; i++)
	{
		draw_set_color(cursor_bottom == i && cursor_y == 8 ? c_yellow : c_white);
		draw_text(bottom_x[i], 408, bottom_options[i]);
	}
}
if (changing_scene)
{
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
}
draw_set_alpha(1);