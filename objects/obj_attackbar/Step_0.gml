/// @description ?
x += spd;
if (x > BATTLE.textbox_x2)
{
	BATTLE.attack_accuracy[num] = 0;
	if (global.weapon_style == WEAPON_STYLE.MULTI)
	{
		audio_play_sound(sfx_attack_miss, 100, false);
	}
	if !(instance_exists(obj_attackbarcharge))
	{
		instance_create_depth(BATTLE.target.x, BATTLE.target.y, 0, obj_playerattack);
	}
	instance_destroy();
}
if (keyboard_check_pressed(ord("Z")))
{
	spd = 0
	if (global.weapon_style == WEAPON_STYLE.MULTI)
	{
		audio_play_sound(sfx_attack_hit, 1, false);
	}
	else
	{
		
	}
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
	if !(instance_exists(obj_attackbarcharge))
	{
		instance_create_depth(BATTLE.target.x, BATTLE.target.y, 0, obj_playerattack);
	}
}