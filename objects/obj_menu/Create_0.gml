/// @description ?
stats_y = (obj_chara.y > obj_camera.y) ? display_get_gui_height() - (52 + 110) : 52;

cd = 1;

menu[0] = "ITEM";
menu[1] = "STAT";

// SPELL and CELL should be tied to story progression
menu[2] = "CELL";
menu[3] = "SPELL";

selected_option = 0;

selected = false;