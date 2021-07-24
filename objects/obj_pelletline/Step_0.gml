/// @description ?
time++;


if (time > 40)
{
	dl = false;
	if ((time div 2) % 2 == 0)
	{
		var ins = instance_create_layer(x, y, "Attacks", obj_pellet);
		ins.target_x = target_x;
		ins.target_y = target_y;
		ins.dir = point_direction(x, y, target_x, target_y);
		ins.spd = 20;
		ins.hsp = lengthdir_x(ins.spd, ins.dir);
		ins.vsp = lengthdir_y(ins.spd, ins.dir);
		spawned++;
	}
}
if (spawned > 8)
{
	instance_destroy();
}