/// @description ?
stats_y = (obj_chara.y > obj_camera.y) ? display_get_gui_height() - (52 + 110) : 52;

cd = 1;

menu[0] = "ITEM";
menu[1] = "STAT";

// SPELL and CELL should be tied to story progression
menu[2] = "CELL";
menu[3] = "SPELL";

disabled = array_create(4, false);

selected_menu = 0;
selected_item = 0;
selected_option = 0;

hierarchy = 0;

disabled[0] = (INVENTORY.item_count <= 0)