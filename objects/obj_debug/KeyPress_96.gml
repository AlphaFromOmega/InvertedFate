/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_encounter))
{
	instance_destroy(obj_encounter);
}
else
{
	instance_create_depth(obj_chara.x, obj_chara.y, obj_chara.depth -1, obj_encounter);
}