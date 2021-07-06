/// @description Insert description here
// You can write your code in this editor
textbox_x = GUI_MARGIN_H;
textbox_y = GUI_MARGIN;

draw_sprite_pscaled(spr_UI_box, 0, textbox_x, textbox_y, GUI_TEXTBOX_WIDTH, GUI_TEXTBOX_HEIGHT, image_angle, image_blend, image_alpha);

draw_sprite_ext(head, image_index, textbox_x + ((160 - GUI_MARGIN) / 2), textbox_y + ((160 - GUI_MARGIN) / 2), 2, 2, 0, c_white, 1);
draw_set_font(fnt_textbox);

draw_set_font(font);
draw_text_special(textbox_x + offset_spr, textbox_y + line_offset, print, animation);