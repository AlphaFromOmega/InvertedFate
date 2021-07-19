/// @description ?
use_string[0] += "#You recoverd 10 HP";
// Inherit the parent event
event_inherited();

audio_play_sound(sfx_heal, 100, false);
if (global.hp <= global.max_hp)
{
	global.hp = min(global.hp + 10, global.max_hp);
}