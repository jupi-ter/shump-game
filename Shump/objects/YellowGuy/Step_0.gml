
event_inherited();


if (can_shoot) {
	can_shoot = false;
	alarm[Alarms.Shoot] = shoot_interval;
	
	with instance_create_layer(x,y,"Instances",LightningHitbox) {
		creator_id = other.id;
	}	
}
