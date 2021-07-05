/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_encounter))
{
	hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
	vdir = keyboard_check(vk_down) - keyboard_check(vk_up);
	image_speed = 0;
	if (hdir != 0)
	{
		sprite_index = (hdir > 0) ? sprite_right : sprite_left;
		image_speed = 1;
	}
	else if (vdir != 0)
	{
		sprite_index = (vdir > 0) ? sprite_down : sprite_up;
		image_speed = 1;
	}
	hsp = hdir * WALK_SPEED;
	vsp = vdir * WALK_SPEED;

	x += hsp;
	y += vsp;
}
else
{
	hsp = 0;
	vsp = 0;
}
camera_set_view_pos(view_camera[0], x - (view_wport[0] / 4), y - (view_hport[0] / 4));


if ((hsp != 0 || vsp != 0) && random(1000) < 1)
{
	instance_create_depth(x, y, depth -1, obj_encounter);
}

if (hsp == 0 && vsp == 0)
{
	image_index = 0;
}