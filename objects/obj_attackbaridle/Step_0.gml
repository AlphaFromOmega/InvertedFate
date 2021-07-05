/// @description ?
if (global.weapon == 4)
{
	image_xscale *= 1.05;
	image_yscale *= 1.05;
	alpha -= 0.05;
}
if (alpha == 0)
{
	instance_destroy();
}