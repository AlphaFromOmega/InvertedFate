/// @description Insert description here
// You can write your code in this editor

hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
vdir = keyboard_check(vk_down) - keyboard_check(vk_up);
image_speed = 0;

hsp = hdir * WALK_SPEED;
vsp = vdir * WALK_SPEED;

if (lock)
{
	hsp = 0;
	vsp = 0;
}
else
{
	if (hdir != 0)
	{
		sprite_index = (hdir > 0) ? sprite_right : sprite_left;
		image_speed = 1;
		direction = (hdir > 0) ? 0 : 180;
	}
	else if (vdir != 0)
	{
		sprite_index = (vdir > 0) ? sprite_down : sprite_up;
		image_speed = 1;
		direction = (vdir > 0) ? 270 : 90;
	}
	if (keyboard_check_pressed(ord("Z")))
	{
		var _ins = noone
		if (direction == 270)
		{
			_ins = collision_line(x, y, x + lengthdir_x(10, direction), y + lengthdir_y(20, direction), all, false, true);
		}
		else
		{
			var bbox_ycenter = (bbox_top + bbox_bottom)/2;
			_ins = collision_line(x, bbox_ycenter, x + lengthdir_x(10, direction), bbox_ycenter + lengthdir_y(10, direction), all, false, true);
		}
		
		if (variable_instance_exists(_ins, "interactable") && _ins.interactable)
		{
			with (_ins)
			{
				event_user(0);
			}
		}
	}
}

collision_player();

if (hsp == 0 && vsp == 0)
{
	image_index = 0;
}

depth = layer_get_depth("Instances") - y;
