/// @description ?
init = true;
array_name = [];
act = [];
act_result = [];
scale = 2;
image_xscale = scale
image_yscale = scale;

normal_sprite = sprite_index;

pivot_x = x;

hit = 0;
present = true;
max_hp = hp;
display_hp = hp;

sprite_destroy = 0;

if (instance_find(object_index, 0) != id)
{
	dust = instance_find(object_index, 0).dust;
	show_debug_message(string(monster_name) + " pixel map was copied");
}
else
{
	var xx, yy;
	for (xx = 0; xx < sprite_get_width(sprite_index); xx++)
	{
		for (yy = 0; yy < sprite_get_height(sprite_index); yy++)
		{
			dust[xx, yy] = sprite_getpixel(sprite_index, image_index, xx, yy);
		}
	}
	show_debug_message(string(monster_name) + " pixel map was created");
}

spareable = false;

recieve = -1;
text_bubble = false;
tb_string = "...";

act_count = [0, 0, 0, 0, 0, 0];