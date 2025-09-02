/// @description Insert description here

#region unused
/*
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
}*/
#endregion

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
	
	//pause the game
	global.pause = true;
	display_boon_text = true;
}

if (display_boon_text) {
	
	if (keyboard_check_pressed(vk_right) && (choice_idx+1 < choices)) {
        choice_idx++;
    }
    if (keyboard_check_pressed(vk_left) && (choice_idx-1 >= 0)) {
        choice_idx--;
    }
    
    
    current_upgrade = global.upgrade_pool[choice_idx];
    
    if (keyboard_check_pressed(vk_space)) {
    	current_upgrade.apply();
    	global.pause = false;
    	display_boon_text = false;
    }
}

camera_set_view_pos(view_camera[0], random(shake)-shake/2, random(shake)-shake/2); 

if (shake > 10)
shake *= 0.8;
if (shake > 0)
shake -= 1;
else
shake = 0;