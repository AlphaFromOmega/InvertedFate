/// @description ?

y = round((obj_battle.ui9slice_y1 - 8) - (bbox_bottom - y));

hp = clamp(hp, 0, max_hp);

display_hp = lerp(display_hp, hp, 0.2);
if (abs(display_hp - hp) < 1)
{
	display_hp = hp;
}

if (hp == 0)
{
	if (sprite_destroy == 0)
	{
		audio_play_sound(sfx_kill, 1, false);
	}
	sprite_destroy++;
	if (sprite_destroy < sprite_get_height(sprite_index))
	{
		for (var xx = 0; xx < array_length(dust); xx++)
		{
			if (dust[xx, sprite_destroy][3] > 0)
			{
				/*Create a particle in position (x + xx, y + yy) here*/
				instance_create_depth(bbox_left + xx * image_xscale, bbox_top + sprite_destroy * image_yscale, depth-1, obj_dust);
			}
		}
	}
	else
	{
		dead = true;
	}
}
else
{
	if (hit > 0)
	{
		x = pivot_x + ((hit div 4 % 2) + 1) * 8;
		hit--;
	}
}