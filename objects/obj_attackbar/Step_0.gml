/// @description ?
x += spd;
if (x > obj_battle.textbox_x2)
{
	obj_battle.attack_accuracy[num] = -1;
	instance_destroy();
}
if (keyboard_check_pressed(ord("Z")))
{
	spd = 0
	audio_play_sound(sfx_hit, 1, false);
	instance_change(obj_attackbaridle,true);
	obj_battle.attack_accuracy[num] = abs((x - display_get_gui_width()/2) / (display_get_gui_width()/2));
}