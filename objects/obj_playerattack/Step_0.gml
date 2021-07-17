/// @description ?
if (sprite_index == spr_slash)
{
	if (image_index == 7)
	{
		image_speed = 0;
		attack--;
	}
}
else
{
	attack--;	
}
if (attack == 0)
{
	var dmg_text = instance_create_depth(x,y,depth - 1, obj_dmgtext);
	target.hit = 30;
	target.hp -= damage;
	dmg_text.damage = damage;
	dmg_text.monster = target;
	audio_play_sound(sfx_monster_hit, 100, false);
	instance_destroy();
}