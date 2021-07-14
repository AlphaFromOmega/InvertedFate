/// @description ?

lerp_prog = 0;

ui9slice_x1 = 0;
ui9slice_y1 = 0;
ui9slice_x2 = 0;
ui9slice_y2 = 0;

sprite_index = sprite_duplicate(sprite_index);

spr_w = sprite_get_width(sprite_index);
spr_h = sprite_get_height(sprite_index);

sprite_set_offset(sprite_index, spr_w/2, spr_h/2);