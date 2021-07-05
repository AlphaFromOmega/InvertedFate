/// @description ?
if ((draw_type == GUI_DRAW.METER) && !instance_exists(obj_attackbar))
{
	var _furthest = noone
	var _x = 0
	for (var i = 0; i < instance_number(obj_attackbarcharge); i++)
	{
		if (instance_find(obj_attackbarcharge,i).x > _x)
		{
			_furthest = instance_find(obj_attackbarcharge,i);
			_x = instance_find(obj_attackbarcharge,i).x;
		}
	}
	with (_furthest)
	{
		instance_change(obj_attackbar,false);
	}
}