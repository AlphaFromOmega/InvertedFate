/// @description Insert description here
// You can write your code in this editor
randomize();

instance_create_depth(0, 0, 0, obj_itemhandler);
instance_create_depth(0, 0, 0, obj_global);
FNT_ATTACK = font_add_sprite_ext(spr_dmgtext, "0123456789", true, 2);

room_goto(rm_titlescreen);