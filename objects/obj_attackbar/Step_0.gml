/// @description ?
x += spd;
if (x > BATTLE.textbox_x2)
{
	BATTLE.attack_accuracy[num] = 0;
	instance_destroy();
}
if (keyboard_check_pressed(ord("Z")))
{
	spd = 0
	audio_play_sound(sfx_hit, 1, false);
	instance_change(obj_attackbaridle,true);
	if (abs(room_width/2 - x) <= 12)
	{
		BATTLE.attack_accuracy[num] = 2.2;
	}
	else
	{
		var meter_width = (BATTLE.textbox_x2 - BATTLE.textbox_x1)/2
		show_debug_message((BATTLE.textbox_x1 + meter_width) - x);
		BATTLE.attack_accuracy[num] = 2 * (1 - abs((BATTLE.textbox_x1 + meter_width) - x) / meter_width);
	}
}