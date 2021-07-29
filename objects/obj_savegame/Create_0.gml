/// @description ?
selected = 0;

textbox_x = 108;
textbox_y = 119;

saved = false;
text = ["Save", "Return"];

QuickLoad();

if (!variable_instance_exists(id, "room_name"))
{
	room_name = ""
}