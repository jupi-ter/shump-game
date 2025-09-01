/// @description Insert description here
global.pause = false;

//score related
actual_score = 0;
visual_score = 0;
target_score = 0;
subscore = 0;
display_subscore = false;
subscore_counter_in_seconds = 0;
multiplier = 1;
combo_counter = 0;

//screen related
viewx = 0;
viewy = 0;
viewx2 = 0;
viewy2 = 0;
shake = 0;

//waves and kills
total_kills = 0;
temp_kills = 0;
wave_counter = 0;
current_wave = global.wave_list[wave_counter];

//level and upgrades
display_boon_text = false;
current_xp = 0;
base_xp = 10;
xp_goal = base_xp;
level = 1;
choices = 3;
current_upgrade = undefined;
choice_idx = 0;
choice_display_xstart = 24;
choice_display_offset = 38;
choice_display_y = 64;
choice_arrow_y = 96;

//font
WeiholmirFont = font_add_sprite(sprWeiholmirFont, ord(" "), true, 1);

//subscribe to events
EventManager.subscribe(global.EventNames.AlienHit, on_alien_death);
EventManager.subscribe(global.EventNames.ScrapPickup, on_scrap_pickup);
