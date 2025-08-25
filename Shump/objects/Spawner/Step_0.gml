if (instance_exists(UberCont)) {
	if (UberCont.kills % UberCont.kills_per_increase == 0) {
		current_interval = max(min_interval_in_seconds, current_interval - reduction_per_step);
	}
}

if (timer<=0) {
	timer = current_interval;
	var xx = random_range(16, room_width-16);
	var yy = -24;
	
	var enemy = 4; //choose(0,1,2,3,4);
	switch(enemy) {
		/*case 0:
			instance_create_layer(xx,yy,"Instances", Spreader);	
		break;
		
		case 1:
			instance_create_layer(xx,yy,"Instances", GreenGuy);	
		break;
		
		case 2:
			instance_create_layer(xx,yy,"Instances", Squid);	
		break;
		
		case 3:
			instance_create_layer(xx,yy,"Instances", OrangeGuy);	
		break;*/
		
		case 4:
			instance_create_layer(xx,yy,"Instances", YellowGuy);
		break;
	}
	
} else {
	timer--;
}