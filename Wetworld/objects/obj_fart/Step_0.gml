/// @description Decrease alpha and increase image angle
image_angle += 2 * sign(hspeed);
image_alpha -= 0.04;
image_xscale = 2 - image_alpha;
image_yscale = image_xscale;
if (image_alpha <= 0) {
	instance_destroy();
}