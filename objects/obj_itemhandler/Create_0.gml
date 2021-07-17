/// @description ?
items = [instance_create_depth(0, 0, 0, itm_gftea), instance_create_depth(0, 0, 0, itm_gftea), noone, noone, noone, noone, noone, noone];
item_count = 0;
for (var i = 0; i < array_length(items); i++;)
{
	if (items[i] == noone)
	{
		break;
	}
	location = i;
	item_count = i + 1;
}