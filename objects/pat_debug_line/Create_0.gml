/// @description ?
event_inherited();

var _originx = BATTLE.textbox_x1 + (BATTLE.textbox_x2 - BATTLE.textbox_x1)/2;
var _originy = BATTLE.textbox_y1 + (BATTLE.textbox_y2 - BATTLE.textbox_y1)/2 - 32;

var square = get_square_points(_originx, _originy, 196);

destined_box(square[0], square[1], square[2], square[3]);

obj_soul.x = _originx;
obj_soul.y = _originy;

attack = 30;

final = false;

final_over = false;

target_x = 0;
target_y = 0;