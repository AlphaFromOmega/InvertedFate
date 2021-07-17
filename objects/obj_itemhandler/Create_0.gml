/// @description ?
items = [instance_create_depth(0, 0, 0, item_gftea), instance_create_depth(0, 0, 0, item_gftea), instance_create_depth(0, 0, 0, item_toy_knife), instance_create_depth(0, 0, 0, item_gftea), instance_create_depth(0, 0, 0, item_stick), noone, noone, noone];
item_count = 0;
for (var i = 0; i < array_length(items); i++;)
{
	if !(instance_exists(items[i]))
	{
		items[i] = noone;
		break;
	}
	location = i;
	item_count = i + 1;
}
sort_items();