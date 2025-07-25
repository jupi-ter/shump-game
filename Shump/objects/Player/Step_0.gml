/// @description Insert description here
// You can write your code in this editor
var moveX, moveY;
var right = 1;
var spd = 2;

moveX = keyboard_check(vk_right) - keyboard_check(vk_left);
moveY = keyboard_check(vk_down) - keyboard_check(vk_up);

if (moveX != 0)
{
	right = moveX;
	image_angle = 15 * -right;
} else image_angle = 0;

var moving = (moveX != 0 || moveY != 0);

if (moving)
{
	//spawn particles
	var random_size = random_range(1, 1.2);
	var random_color = choose(global.Colors.White,global.Colors.Red, global.Colors.Yellow, global.Colors.Orange);
	CreateParticle(x+random_range(-2,2),y+random_range(-2,2),random_size,random_size,0.1,random(359),GetColorByIndex(random_color), 1);
}

if (keyboard_check(vk_space) && can_shoot && currentWeapon.is_automatic) 
{
	can_shoot = false;
	alarm[0] = currentWeapon.fire_rate;
		
	if (currentWeapon == Machinegun)
	{
		var bullet = instance_create_layer(x,y,"Instances", Bullet);
		with (bullet)
		{
			motion_add(90+random_range(-5,5), 5);		
		}
		bullet.image_angle = bullet.direction;
		with (UberCont)
		{
			shake += other.currentWeapon.screenshake;
		}
	}
		
	if (currentWeapon == TripleMachinegun)
	{
		for (var i = 0; i < 3; i++)
		{
			var bullet = instance_create_layer(x,y,"Instances", Bullet);
			with (bullet)
			{
				motion_add(60+15*(i+1)+random_range(-5,5), 5);		
			}
			bullet.image_angle = bullet.direction;
		}
	}
}

x+=moveX * spd;
y+=moveY * spd;