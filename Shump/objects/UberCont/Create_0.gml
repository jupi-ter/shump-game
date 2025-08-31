/// @description Insert description here
// You can write your code in this editor
score = 0;
subscore = 0;
display_subscore = false;
multiplier = 1;

//screen related shit
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

//idk whatever
current_xp = 0;
base_xp = 10;
xp_goal = base_xp;
level = 1;

WeiholmirFont = font_add_sprite(sprWeiholmirFont, ord(" "), true, 1);

//subscribe to events
EventManager.subscribe(global.EventNames.AlienHit, on_alien_death);
