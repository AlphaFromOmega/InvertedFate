/// @description ?
full = false;
room_x = -1;
room_y = -1;

ResetGame();

t = 0;

saved_room = rm_ruins_flowey;
saved_name = "No Room - This file may be unstable"
LoadGame();

update_stats();

global.hp = global.max_hp;

global.xp_required = [0, 10, 30, 70, 120, 200, 300, 500, 800, 1200, 1700, 2500, 3500, 5000, 7000, 10000, 15000, 25000, 50000, 99999];

global.music = noone;

global.flags = ds_map_create();

