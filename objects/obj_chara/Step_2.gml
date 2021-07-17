/// @description ?
if ((hsp != 0 || vsp != 0) && random(1000) < 1)
{
	instance_create_depth(x, y, depth -1, obj_encounter);
}