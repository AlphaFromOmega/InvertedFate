for (var i = 0; i < 6; i++)
{
	instance_create_depth(obj_soul_anim.x, obj_soul_anim.y, obj_soul_anim.depth -1, obj_soul_shatter);
}
instance_destroy(obj_soul_anim);
audio_play_sound(sfx_soul_shatter, 1, false);