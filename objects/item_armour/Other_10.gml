/// @description ?

// Inherit the parent event
event_inherited();

INVENTORY.items[location] = instance_create_depth(0, 0, 0, global.armour);

global.armour = object_index;