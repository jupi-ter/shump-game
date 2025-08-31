if (!global.pause) {
	if (timer<=0) {
		timer = base_interval_in_seconds;
		var xx = random_range(16, room_width-16);
		var yy = -24;
		
		var amount_of_unique_enemies = array_length(UberCont.current_wave.enemy_pool);
		var enemy_index = irandom(amount_of_unique_enemies - 1);
		
		var enemy_instance = instance_create_layer(xx,yy,"Instances", UberCont.current_wave.enemy_pool[enemy_index]);
		
		//this was to add enemies to a stack.
		//if (instance_exists(UberCont)) {
		//	UberCont.enemy_stack.
		//}
			
	} else {
		timer--;
	}
}