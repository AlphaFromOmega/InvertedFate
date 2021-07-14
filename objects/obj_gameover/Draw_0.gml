/// @description ?
draw_set_alpha(alpha);	
draw_sprite(sprite_index, image_index, room_width/2, room_height/4);

draw_set_alpha(1);
draw_set_font(fnt_textbox);
draw_text_special(room_width/4, room_height * 0.6, print, 0);
