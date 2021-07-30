/// @description ?
change_music(mus_cut_intro);
y_location = 0;
fade = 0;
fade_adjust = 0.02;

page = 0;

print = [];

sprites = [spr_intro_00, spr_intro_01, spr_intro_02, spr_intro_03, spr_intro_03, spr_intro_04, spr_intro_05, spr_intro_06, spr_intro_07, spr_intro_08, spr_intro_09];
text = [S_WHITE + "You've fallen a long way, but somehow, you survived.", S_WHITE + "You're alone and the sun looks so distant.", S_WHITE + "As you look around, you wonder where you are.", S_WHITE + "It's cold it's damp and yet you feel like you're home...", S_WHITE + "* But that's crazy...", S_WHITE + "Still, you press on. A new adventure has just begun...", S_WHITE + "You're filled with determination.", S_WHITE + "* Hello?"];

typewriter_init();

for (var i = 0; i < array_length(sprites); i++;)
{
	if (i >= array_length(text))
	{
		text[i] = "";
	}
	text[i] = string_to_array(convert_string(text[i], 400, fnt_textbox, false));
}
