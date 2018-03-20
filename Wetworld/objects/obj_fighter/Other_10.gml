/// @description Jump event
if (platform != noone) {
	y_momentum = -jump_power;
	platform = noone;
}
else if (!double_jumped) {
	y_momentum = -jump_power;
	double_jumped = true;
}