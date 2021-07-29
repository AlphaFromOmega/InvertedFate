/// @description ?

lock = (instance_exists(par_ui) || instance_exists(obj_encounter));

if (keyboard_check_pressed(ord("C")) && !lock)
{
	lock = true;
	instance_create_depth(0, 0, 0, obj_menu);
}
