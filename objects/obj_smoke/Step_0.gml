/// @description ?

image_alpha *= 0.95;

scale *= 0.99;

hsp *= 0.95;
vsp *= 0.95;


image_xscale = scale;
image_yscale = scale;

x += hsp;
y += vsp;

if (image_alpha < 0.3)
{
	instance_destroy();
}
