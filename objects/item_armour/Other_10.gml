/// @description ?

// Inherit the parent event
event_inherited();

if (object_exists(global.armour))
{
	INVENTORY.items[location] = instance_create_depth(0, 0, 0, global.armour);
}

global.armour = object_index;