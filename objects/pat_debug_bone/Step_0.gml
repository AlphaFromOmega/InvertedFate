/// @description ?
if (attack == 0)
{
	switch (round(random(1)))
	{
		case 0:
		{
			var instances = create_circular_attack(obj_pellet, obj_soul.x, obj_soul.y, 128, 4, 0);
			for (var i = 0; i < array_length(instances); i++;)
			{
				with(instances[i])
				{
					target_x = obj_soul.x;
					target_y = obj_soul.y;
					spd = 4;
				}
			}
			break;
		}
		case 1:
		{
			var instances = create_circular_attack(obj_pellet, obj_soul.x, obj_soul.y, 128, 4, 45);
			for (var i = 0; i < array_length(instances); i++;)
			{
				with(instances[i])
				{
					target_x = obj_soul.x;
					target_y = obj_soul.y;
					spd = 4;
				}
			}
			break;
		}
	}
	attack = 45;
}
else if (attack == -1)
{
	if (!final_over && final)
	{
		var instances = create_circular_attack(obj_pellet, target_x, target_y, 1024, 4, 0);
		for (var i = 0; i < array_length(instances); i++;)
		{
			with(instances[i])
			{
				x = clamp(x, 0, room_width);
				y = clamp(y, 0, room_height);
				target_x = other.target_x;
				target_y = other.target_y;
				spd = point_distance(x, y, target_x, target_y) / 32;
			}
		}
		if (instance_number(obj_pellet) > 256)
		{
			final_over = true;
		}
	}
	if (instance_number(obj_pellet) == 0)
	{
		if (!final)
		{
			target_x = obj_soul.x;
			target_y = obj_soul.y;
			final = true;
		}
		else
		{
			end_turn();
		}
	}
}
else
{
	attack--;
}
