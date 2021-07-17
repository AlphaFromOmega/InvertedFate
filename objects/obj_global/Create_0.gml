/// @description ?
full = false;

global.name = "Chara";

global.xp = 0;
global.lv = 1;
global.gold = 0;

global.inv = 30;
global.kills = 0;

update_stats();

global.hp = global.max_hp;

global.item_at = 0;
global.item_df = 0;

global.xp_required = [0, 10, 30, 70, 120, 200, 300, 500, 800, 1200, 1700, 2500, 3500, 5000, 7000, 10000, 15000, 25000, 50000, 99999];

global.music = noone;

change_music(mus_ruins);