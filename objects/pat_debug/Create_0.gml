/// @description ?

// Inherit the parent event
event_inherited();

var pat;

pat[0] = pat_debug_cross;
pat[1] = pat_debug_line;

instance_create_depth(0, 0, 0, pat[floor(random(2))]);