/// @description On Use
if (instance_exists(obj_battle))
{
	for (var i = 0; i < array_length(use_string); i++;)
	{
		array_use_string[i] = string_to_array(convert_string(use_string[i], BATTLE.textbox_width));
	}
}
else
{
	for (var i = 0; i < array_length(use_string); i++;)
	{
		create_textbox(use_string[i], 30, fnt_textbox, noone, sfx_voice_generic);
	}
}