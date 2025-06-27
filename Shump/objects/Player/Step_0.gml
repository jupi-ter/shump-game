/// @description Insert description here
// You can write your code in this editor
var moveX, moveY;
var right = 1;
var spd = 2;

moveX = keyboard_check(vk_right) - keyboard_check(vk_left);
moveY = keyboard_check(vk_down) - keyboard_check(vk_up);

if (moveX != 0) {
	right = moveX;
	image_angle = 15 * -right;
} else image_angle = 0;

var moving = (moveX != 0 || moveY != 0);

if (moving) {
	//spawn particles
}

if (keyboard_check(vk_space) && can_shoot) {
	can_shoot = false;
	alarm[0] = 5;
	var bullet = instance_create_layer(x,y,"Instances", Bullet);
	with (bullet) {
		motion_add(90+random_range(-3,3), 5);		
	}
	bullet.image_angle = bullet.direction;
}

x+=moveX * spd;
y+=moveY * spd;