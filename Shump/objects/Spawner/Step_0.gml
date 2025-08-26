if (instance_exists(UberCont)) {
	if (UberCont.kills % UberCont.kills_per_increase == 0) {
		current_interval = max(min_interval_in_seconds, current_interval - reduction_per_step);
	}
}

if (timer<=0) {
	timer = current_interval;
	var xx = random_range(16, room_width-16);
	var yy = -24;
	
	var enemy_index = choose(0,1,2,3,4);
	var enemy_object = AlienParent;
	switch(enemy_index) {
		case 0:
			 enemy_object = Spreader;
		break;
		
		case 1:
			enemy_object = GreenGuy;	
		break;
		
		case 2:
			enemy_object = Squid;	
		break;
		
		case 3:
			enemy_object = OrangeGuy;	
		break;
		
		case 4:
			enemy_object = YellowGuy;
		break;
	}
	
	instance_create_layer(xx,yy,"Instances", enemy_object);	
	
} else {
	timer--;
}