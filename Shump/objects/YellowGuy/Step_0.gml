
event_inherited();

if (can_shoot) {
	can_shoot = false;
	alarm[0] = shoot_interval;
	//lightning goes here
	lightning = true;
	instance_activate_object(hitbox);
	alarm[2] = laser_timer;
}