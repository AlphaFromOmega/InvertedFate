/// @description Attack Mode
if (attacking)
{
	if (attack <= 0)
	{
		var rnd = random(3);
		for (var i = 0; i < ceil(rnd); i++;)
		{
			var _ins = instance_create_depth(0, 0, 0, obj_pelletline);
	
			_ins.target_x = obj_soul.x;
			_ins.target_y = obj_soul.y;
	
			_ins.direction = random(360);
		}
		attack = (2 + rnd) * 10;
	}
	else
	{
		attack--;
	}
}
else
{
	if !(instance_exists(par_attack))
	{
		end_turn();
	}
}