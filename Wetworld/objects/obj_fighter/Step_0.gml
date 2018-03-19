/// @description All the updates using x_impulse and y_impulse
if (x_impulse == 0) {
	x_momentum -= sign(x_momentum) * 2;
	if (abs(x_momentum) < 2) {
		x_momentum = 0;
	}
}
else if (sign(x_impulse) != sign(x_momentum)) {
	x_momentum += x_impulse / 20;
}
else {
	x_momentum += x_impulse / 100;
}

var x_change = x_momentum;
while (place_meeting(x + x_change, y, obj_solid) && x_change != 0) {
	x_momentum = 0;
	x_change -= sign(x_change)/10;
	if (abs(x_change) < 0.1) {
		x_change = 0;
	}
}
x += x_change;

y_momentum += 0.2;

var y_change = y_momentum;
while (place_meeting(x, y + y_change, obj_solid) && y_change != 0) {
	y_momentum = 0;
	y_change -= sign(y_change)/10;
	if (abs(y_change) < 0.1) {
		y_change = 0;
	}
}
y += y_change;