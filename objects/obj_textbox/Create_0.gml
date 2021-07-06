/// @description Insert description here
// You can write your code in this editor

/*str = "[$="+string(c_white)+"]Testing String is very" +
		" \n" + "long in order to show [$="+string(c_blue)+"]" +
		" \n" + "line breaks";*/
print = "";
//voice = sfx_voice_asgore;
//change = 10;
char = 0;

textbox_max_size = string_height("J") * 3;
hmargin = textbox_max_size;

color = c_white;
l = 0;

draw_set_font(fnt_textbox);
max_line_height = string_height("A") * 3;


line_offset = (GUI_TEXTBOX_HEIGHT - max_line_height)/2;
draw_set_font(fnt_textbox);
