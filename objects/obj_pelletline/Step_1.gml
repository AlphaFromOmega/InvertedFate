/// @description ?
if !(spawned)
{
	x = target_x + lengthdir_x(-1000, direction);
	y = target_y + lengthdir_y(-1000, direction);
	
	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
	
	direction = point_direction(x, y, target_x, target_y);

	spawned = true;
	dl = true;
}