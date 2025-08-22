/// @description Insert description here
// You can write your code in this editor

if (current_xp >= xp_goal) {
	current_xp = 0;
	level++;
	xp_goal = base_xp * level;
	
	//AQUI TEM QUE ACONTECER UM EVENTO FODA
	//create boon choices
	
	var width = 26;
	var height = 64; 

	var offset = 38;
	
	for (i = 0; i <= 2; i++) {
		instance_create_layer(width+(offset*i),height,"Instances",Button);
	}
	
}

camera_set_view_pos(view_camera[0], random(shake)-shake/2, random(shake)-shake/2); 

if (shake > 10)
shake *= 0.8;
if (shake > 0)
shake -= 1;
else
shake = 0;