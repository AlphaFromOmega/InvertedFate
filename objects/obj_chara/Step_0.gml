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
	}
	else if (vdir != 0)
	{
		sprite_index = (vdir > 0) ? sprite_down : sprite_up;
		image_speed = 1;
	}
}

x += hsp;
y += vsp;

if (hsp == 0 && vsp == 0)
{
	image_index = 0;
}
