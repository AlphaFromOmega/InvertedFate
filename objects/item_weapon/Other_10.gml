/// @description ?

event_inherited();

INVENTORY.items[location] = instance_create_depth(0, 0, 0, global.weapon);

global.weapon = object_index;

// Inherit the parent event