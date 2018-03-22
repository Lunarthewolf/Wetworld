/// @description All the updates using x_impulse and y_impulse
var prev_xmo = x_momentum;
if (sign(x_impulse) != sign(x_momentum) && abs(x_impulse) == 50 && platform != noone && alarm[0] > 0) {
	x_momentum = 0;
}
if (x_impulse == 0) {
	x_momentum -= sign(x_momentum);
	if (abs(x_momentum) < 2) {
		x_momentum = 0;
	}
}
else if (sign(x_impulse) != sign(x_momentum)) {
	x_momentum += x_impulse / 40;
}
else if (abs(x_momentum) <= max_speed) {
	x_momentum += x_impulse / 10;
}

var x_change = x_momentum;
while (place_meeting(x + x_change, y, obj_solid) && x_change != 0) {
	x_momentum = 0;
	x_change -= sign(x_change)/10;
	if (abs(x_change) < 0.1) {
		x_change = 0;
	}
}
if (sign(prev_xmo) != sign(x_momentum) && x_momentum != 0 && abs(x_impulse) == 50 && platform != noone) {
	var fart = instance_create_layer(x, bbox_bottom, "Effects", obj_fart);
	fart.hspeed = -2 * sign(x_impulse);
	alarm[0] = dash_time;
}
x += x_change;

y_momentum += 0.5;

var y_change = y_momentum;
platform = noone;
while (place_meeting(x, y + y_change, obj_solid) && y_change != 0) {
	y_momentum = 0;
	if (y_change > 0 && platform == noone) {
		platform = instance_place(x, y + y_change, obj_solid);
		double_jumped = false;
	}
	y_change -= sign(y_change)/10;
	if (abs(y_change) < 0.1) {
		y_change = 0;
	}
}
y += y_change;