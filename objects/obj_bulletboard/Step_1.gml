/// @description ?

lerp_prog += (1 + lerp_prog) / 50;

ui9slice_x1 = lerp(ui9slice_x1, destined_x1, lerp_prog);
ui9slice_y1 = lerp(ui9slice_y1, destined_y1, lerp_prog);
ui9slice_x2 = lerp(ui9slice_x2, destined_x2, lerp_prog);
ui9slice_y2 = lerp(ui9slice_y2, destined_y2, lerp_prog);

x = ui9slice_x1 + (ui9slice_x2 - ui9slice_x1)/2;
y = ui9slice_y1 + (ui9slice_y2 - ui9slice_y1)/2;

var pixel_width = ui9slice_x2 - ui9slice_x1;
var pixel_height = ui9slice_y2 - ui9slice_y1;

image_xscale =  pixel_width / spr_w;
image_yscale =  pixel_height / spr_h;