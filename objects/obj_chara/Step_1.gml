/// @description ?

lock = (instance_exists(obj_menu) || instance_exists(obj_encounter) || instance_exists(obj_textbox));

if (keyboard_check_pressed(ord("C")) && !lock)
{
	lock = true;
	instance_create_depth(0, 0, 0, obj_menu);
}
