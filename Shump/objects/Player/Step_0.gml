/// @description Insert description here
// You can write your code in this editor
var moveX, moveY;
var right = 1;
var spd = 2;
counter++;

moveX = keyboard_check(vk_right) - keyboard_check(vk_left);
moveY = keyboard_check(vk_down) - keyboard_check(vk_up);

if (moveX != 0)
{
	right = moveX;
	//image_angle = 10 * -right;
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
		
	var bullet = instance_create_layer(x,y,"Instances", Bullet);
	with (bullet)
	{
		motion_add(90+random_range(-5,5), 5);		
	}
	bullet.image_angle = bullet.direction;
	with (UberCont)
	{
		shake += other.screenshake;
	}
}

x+=moveX * spd;
y+=moveY * spd;