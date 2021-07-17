/// @description ?
if (global.weapon_style == WEAPON_STYLE.MULTI)
{
	image_xscale *= 1.05;
	image_yscale *= 1.05;
	alpha -= 0.05;
}
else
{
	timer--;
}
if (alpha <= 0 || timer <= 0)
{
	instance_destroy();
}