/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (can_shoot) {
	can_shoot = false;
	alarm[Alarms.Shoot] = shoot_interval;
	for (var i = 1; i < 4; i++) {
		var angle = i * -45;
		with (instance_create_layer(x,y,"Instances",Flower)) {
			motion_add(angle, other.projectile_speed);
			image_angle = direction;
		}
	}
}