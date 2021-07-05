/// @description ?

if (move)
{
	target_x = view_x + (17 + GUI_BATTLE_MARGIN_W)/2
	target_y = view_y + (display_get_gui_height() - (sprite_get_height(spr_ui_battle_act)/2 + GUI_BATTLE_MARGIN_H))/2;
	if (distance_to_point(target_x, target_y) > 5)
	{
		move_towards_point(target_x, target_y, 5);
	}
	else
	{
		x = target_x;
		y = target_y;
		instance_destroy();
		room_goto(rm_battle);
	}
}