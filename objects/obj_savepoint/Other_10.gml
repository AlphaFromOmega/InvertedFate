/// @description On interact

create_textbox(S_WHITE + "(For some reason, this place feels familar to you, fueling your determination.)", 30, fnt_textbox, noone, sfx_voice_generic, 0);

if (global.hp < global.max_hp)
{
	global.hp = global.max_hp;
}
audio_play_sound(sfx_savepoint, 50, false);