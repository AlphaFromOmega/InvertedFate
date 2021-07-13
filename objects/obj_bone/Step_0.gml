/// @description ?
x -= 2;

if (collision_rectangle(x, y, x + sprite_width, BB.ui9slice_y2, obj_soul, false, true))
{
	damage_player(damage);
}
if (x < BB.ui9slice_x1)
{
	instance_destroy();
}