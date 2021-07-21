/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_camera))
{
	instance_create_depth(x, y, 0, obj_camera);
}

sprite_left = spr_chara_left;
sprite_down = spr_chara_down;
sprite_right = spr_chara_right;
sprite_up = spr_chara_up;

lock = false;

spawn_x = -1;
spawn_y = -1;