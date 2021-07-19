/// @description ?
if (init)
{
	if (check_atk = "")
	{
		check_atk = attack;
	}
	if (check_def = "")
	{
		check_def = defence;
	}
	array_name = string_to_array(convert_string(S_WHITE + monster_name, 256));
	if (check)
	{
		act[0] = string_to_array(convert_string(S_WHITE + "Check", 128));
		act_result[0][0] = string_to_array(convert_string(S_WHITE + string_upper(monster_name) + " ATK " + string(check_atk) + " DEF " + string(check_def) + "#" + string(check_text[0]), (BATTLE.textbox_x2 + GUI_MARGIN * 1.25) - (BATTLE.textbox_x1 + GUI_MARGIN * 1.25) - 32));
		for (var i = 1; i < array_length(check_text); i++;)
		{
			act_result[0][i] = string_to_array(convert_string(string(check_text[i]), (BATTLE.textbox_x2 + GUI_MARGIN * 1.25) - (BATTLE.textbox_x1 + GUI_MARGIN * 1.25) - 32));
		}
	}
	init = false;
}
if (spareable)
{
	array_name = string_to_array(convert_string(S_YELLOW + monster_name, 256));
}

y = round((BB.ui9slice_y1 - 8) - (bbox_bottom - y));

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
		x = pivot_x + sin(hit/2) * 8;
		hit--;
	}
}