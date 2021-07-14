instance_create_depth(obj_soul.x, obj_soul.y, obj_soul.depth - 1, obj_soul_anim);
instance_destroy(obj_soul);

change_music(noone);

obj_soul_anim.image_speed = 0;