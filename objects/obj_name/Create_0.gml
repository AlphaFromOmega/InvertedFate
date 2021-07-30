/// @description ?
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var k = 1;
for (var j = 0; j < 4; j++)
{
	for (var i = 0; i < 7; i++)
	{
		total_case[i][j] = string_copy(string_upper(alphabet),k,1);
		total_case[i][j + 4] = string_copy(string_lower(alphabet),k,1);
		k++;
	}
}
if (obj_global.previous_name == "")
{
	done = false;
	player_name = "";
	text = "Is this name correct?";
	changeable = true;
}
else
{
	player_name = obj_global.previous_name;
	if (player_name == "Chara")
	{
		changeable = !file_exists("save.dtr");
	}
	else
	{
		changeable = false;
	}
	done = true;
	text = "A name has already\nbeen chosen.";
}
allowed = true;

bottom_options = ["Quit", "Backspace", "Done"];
bottom_x = [120, 240, 440];

cursor_x = 0;
cursor_y = 0;

cursor_bottom = 0;

changing_scene = false;
alpha = 0;

lrp = 0;