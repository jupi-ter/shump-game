/// @description Insert description here
// You can write your code in this editor
can_shoot = true;
max_hp = 3;
hp = max_hp;
bombs = 1;

//invulnerable state after being hit
bool_hitstun = false;

flash = false;
	
// weapon data
damage = 1;
fire_rate = 7;
screenshake = 3;
is_automatic = true;
bullet_amount = 1;
bullet_speed = 5;
bullet_spread_value = 5;
//bullet_type = 0;

flash_and_squash_timer_in_frames = 7; //FRAMES
hitstun_timer = 45;
blink = hitstun_timer;

//misc
counter = 0;

//movement
vx = 0;
vy = 0;
smoothing_factor = 0.8;