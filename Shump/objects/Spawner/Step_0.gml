timer++;

if (timer >= interval * game_get_speed(gamespeed_fps)) {
	timer = 0;
	var xx = random_range(16, room_width-16);
	var yy = -24;
	instance_create_layer(xx,yy,"Instances", Spreader);
}