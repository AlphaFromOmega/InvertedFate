/// @description Battleboard becomes Square

var _originx = textbox_x1 + (textbox_x2 - textbox_x1)/2;
var _originy = textbox_y1 + (textbox_y2 - textbox_y1)/2 - 32;

var _square = display_get_gui_width() / 3;

destined_x1 = _originx - _square/2;
destined_y1 = _originy - _square/2;
destined_x2 = _originx + _square/2;
destined_y2 = _originy + _square/2;
lerp_prog = 0;