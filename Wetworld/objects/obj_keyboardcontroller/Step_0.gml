/// @description Control fighter with the keyboard

if (fighter != noone) {
	if (keyboard_check(ord("D"))) {
		fighter.x_impulse = 50;
	}
	else if (keyboard_check(ord("A"))) {
		fighter.x_impulse = -50;
	}
	else {
		fighter.x_impulse = 0;
	}
	
	if (keyboard_check_pressed(ord("K"))) {
		with (fighter) {event_user(0);}
	}
}