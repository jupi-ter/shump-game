
event_inherited();


if (can_shoot) {
	can_shoot = false;
	alarm[0] = shoot_interval;
	instance_create_layer(x,y,"Instances",LightningHitbox);
}
