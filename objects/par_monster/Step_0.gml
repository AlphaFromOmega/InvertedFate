/// @description ?
if (text_bubble && sprite_destroy == 0 && present)
{
	var ins = instance_create_depth(x + tb_offset_x, y + tb_offset_y, depth - 1, obj_textbubble);
	ins.sprite_index = tb_sprite;
	ins.text = tb_string;
	ins.owner = id;
	text_bubble = false;
}