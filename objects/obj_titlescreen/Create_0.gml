/// @description ?

obj_global.previous_name = "Chara"
selected = 0;

depth = 0;

text = ["Continue", "Reset", "Settings"];
text_x = [170, 350, 270];
text_y = [228, 228, 265];


i_text = ["Begin Game", "Settings"];

time = 0;

if (file_exists("save.dtr"))
{
	obj_global.previous_name = global.name;
	QuickLoad();
}