/// @description Insert description here
// You can write your code in this editor
if (!global.pause) {
	var moveX, moveY;
	var right = 1;
	var spd = 2;
	counter++;
	
	// Get movement input
	var moveX = keyboard_check(vk_right) - keyboard_check(vk_left);
	var moveY = keyboard_check(vk_down) - keyboard_check(vk_up);
	
	// Normalize diagonal movement
	if (moveX != 0 || moveY != 0) {
	    var len = point_distance(0, 0, moveX, moveY);
	    moveX /= len;
	    moveY /= len;
	}
	
	// Target velocity
	var target_vx = moveX * spd;
	var target_vy = moveY * spd;
	
	// Smoothly approach target velocity
	vx += (target_vx - vx) * smoothing_factor;
	vy += (target_vy - vy) * smoothing_factor;
	
	// Move
	x += vx;
	y += vy;
	
	// must clamp again!!!
	var half_w = sprite_width  * 0.5;
	var half_h = sprite_height * 0.5;

	x = clamp(x, half_w, 128 - half_w);
	y = clamp(y, half_h, 128 - half_h);
	
	
	if (moveX != 0)
	{
		right = moveX;
		image_angle = 5 * -right;
		if (right == -1) sprite_index = sprShipLeft; 
		if (right == 1) sprite_index = sprShipRight;
	} else {
		image_angle = 0;
		sprite_index = sprShipCenter;	
	}
	
	var moving = (moveX != 0 || moveY != 0);
	
	var random_size = random_range(0.6, 0.9);
	var random_color = choose(global.Colors.DarkPurple, global.Colors.Red, global.Colors.Yellow, global.Colors.Orange);
	
	//AFTERBURNER
	CreateParticle(x+random_range(-2,2),y+4+random_range(-2,2),random_size,random_size,0.05,random(359),GetColorByIndex(random_color), 1, true);
	
	//SMOKE
	if (counter % 8 == 0) {
		var smoke_size = 0.4;
		var y_offset = 4;
		var shrink_amnt = 0.004;
		CreateParticle(x+random_range(-2,2),y+y_offset, smoke_size, smoke_size, shrink_amnt, random(359), GetColorByIndex(global.Colors.LightGrey), 1, true);
	}
	
	if (counter >= 60) {
		counter = 0;
	}
	
	if (keyboard_check(vk_space) && can_shoot && is_automatic) 
	{
		can_shoot = false;
		alarm[Alarms.Shoot] = fire_rate;
			
		for (i = 0; i < bullet_amount; i++) {
			ShootPattern(bullet_amount, i);
		}
		UberCont.shake += other.screenshake;
	}
}

function ShootPattern(_amount, _index) {
	var angle = 0;
	switch(_amount) {
		case 1:
		case 2:
		angle = 90;
		break;
		
		default:
		var step = 35 / (_amount - 1);
		var base_start = 90 - 35 / 2;
		angle = base_start + _index * step;
		break;
	}
	ShootBullet(angle);
}

function ShootBullet(_angle) {
	with (instance_create_layer(x,y,"Instances", Bullet))
	{	
		parent_instance = other.id;
		motion_add(_angle+random_range(-other.bullet_spread_value,other.bullet_spread_value), other.bullet_speed);
		set_speed = other.bullet_speed;
		image_angle = direction;
	}
}