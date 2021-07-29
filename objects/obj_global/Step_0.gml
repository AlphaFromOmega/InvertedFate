/// @description ?
window_set_fullscreen(full);

if (instance_exists(obj_encounter))
{
	global.lastroom = room;
}

if (room_speed <= t)
{
	global.time++;
	t = 0;
}
t++;