/// @description ?

owner = obj_monster

hsp = lerp(hsp, lengthdir_x(spd, dir), accel/1000);
vsp = lerp(vsp, lengthdir_y(spd, dir), accel/1000);

if (distance_to_point(target_x, target_y) <= spd)
{
	passed = true;
}

x += hsp;
y += vsp;

if (passed && (x < 0 || x > room_width || y < 0 || y > room_height))
{
	instance_destroy();
}
accel++;
