/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited()

if (can_shoot) {
	can_shoot = false;
	alarm[0] = shoot_interval;
	
	var player_angle = 0.0
	if (instance_exists(Player)) {
		player_angle = point_direction(x,y,Player.x, Player.y);
	}
	
	with (instance_create_layer(x,y,"Instances",EnemyBullet)) {
		motion_add(player_angle+random_range(5,-5), 0.5);
		image_angle = direction;
	}
}