/// @description ?
if (instance_exists(obj_chara) && room_x != -1 && room_y != -1)
{
	obj_chara.x = room_x;
	obj_chara.y = room_y;
	
	room_x = -1;
	room_y = -1;
}