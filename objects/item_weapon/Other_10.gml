/// @description ?

event_inherited();

if (global.weapon == 0)
{
	INVENTORY.items[location] = instance_create_depth(0, 0, 0, item_stick);
}
else
{
	INVENTORY.items[location] = instance_create_depth(0, 0, 0, global.weapon);
}

global.weapon = object_index;

// Inherit the parent event