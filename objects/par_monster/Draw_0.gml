/// @description ?
if (global.hp > 0)
{
	if (hp > 0)
	{
		if (present)
		{
			if (hit == 0)
			{
				event_user(0);
			}
			else
			{
				draw_sprite_ext(hurt_sprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			}
		}
		else
		{
			draw_sprite_ext(hurt_sprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha/2);
		}
	}
	else
	{
		draw_sprite_part_ext(sprite_index, 0, 0, (sprite_destroy-3), sprite_get_width(sprite_index), 1, bbox_left, bbox_top + (sprite_destroy-6) * image_yscale, image_xscale, image_yscale, image_blend, image_alpha*1/4);
		draw_sprite_part_ext(sprite_index, 0, 0, (sprite_destroy-2), sprite_get_width(sprite_index), 1, bbox_left, bbox_top + (sprite_destroy-3) * image_yscale, image_xscale, image_yscale, image_blend, image_alpha*2/4);
		draw_sprite_part_ext(sprite_index, 0, 0, (sprite_destroy-1), sprite_get_width(sprite_index), 1, bbox_left, bbox_top + (sprite_destroy-1) * image_yscale, image_xscale, image_yscale, image_blend, image_alpha*3/4);
		draw_sprite_part_ext(sprite_index, 0, 0, sprite_destroy, sprite_get_width(sprite_index), sprite_get_height(sprite_index), bbox_left, bbox_top + sprite_destroy * image_yscale, image_xscale, image_yscale, image_blend, image_alpha);
	}
}