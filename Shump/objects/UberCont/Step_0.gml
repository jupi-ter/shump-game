/// @description Insert description here

if (combo_counter > 0) {
	combo_counter--;
} else {
	//combo ended.
	multiplier = 1;
}


if (subscore_counter_in_seconds > 0) {
	subscore_counter_in_seconds--;
} else {
	//counter ended.
	subscore_counter_in_seconds = 0;
	display_subscore = false;
	score += (subscore * multiplier);
	score = round(score);
	subscore = 0;
}

//tally up score.
if (visual_score < score) {
  visual_score++;
}

if (temp_kills >= current_wave.enemy_amount)
{
	temp_kills = 0;
	wave_counter++;
	current_wave = global.wave_list[wave_counter];
}

if (current_xp >= xp_goal) {
	current_xp = 0;
	level++;
	xp_goal = base_xp * level;
	
	//AQUI TEM QUE ACONTECER UM EVENTO FODA
	//create boon choices
	
	var width = 26;
	var height = 64; 

	var offset = 38;
	
	//for (i = 0; i <= 2; i++) {
	//	instance_create_layer(width+(offset*i),height,"Instances",Button);
	//}
	
}

camera_set_view_pos(view_camera[0], random(shake)-shake/2, random(shake)-shake/2); 

if (shake > 10)
shake *= 0.8;
if (shake > 0)
shake -= 1;
else
shake = 0;