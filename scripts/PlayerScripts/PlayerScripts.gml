function scr_controls()
{
	hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
	vdir = keyboard_check(vk_down) - keyboard_check(vk_up);
}

function collision_player()
{	
	if (place_meeting(x + hsp, y, obj_solid))
	{
		var n_hsp = 0;
		while (!place_meeting(x + n_hsp + sign(hsp), y, obj_solid))
		{
			n_hsp += sign(hsp);
		}
		hsp = n_hsp;
	}
	x += hsp;
	
	if (place_meeting(x, y + vsp, obj_solid))
	{
		var n_vsp = 0;
		while (!place_meeting(x, y + n_vsp + sign(vsp), obj_solid))
		{
			n_vsp += sign(vsp);
		}
		vsp = n_vsp;
	}
	y += vsp;
}