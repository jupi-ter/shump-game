event_inherited()

if (can_shoot) {
	can_shoot = false;
	alarm[0] = shoot_interval;
	for (var i = 0; i < 5; i++) {
		var angle = i * -45;
		with (instance_create_layer(x,y,"Instances",EnemyBullet)) {
			motion_add(angle, 0.5);
			image_angle = direction;
		}
	}
}