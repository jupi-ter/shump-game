time += 0.05;
image_angle = amplitude * sin(time * angle_spd);

y += descent_speed;

var random_size = random_range(1, 1.2);
CreateParticle(x+random_range(-2,2),y-2+random_range(-2,2),random_size,random_size,0.05,random(359),GetColorByIndex(myColor), 1);

//var isOutsideRoom = (y < -16) || (y > room_height + 16);

if (y > room_height) {
	move_wrap(false, true, 16);
    if (descent_speed < descent_limit) {
        descent_speed += 0.1;
    }
}

//?
if (y >= 4) {
	if (!has_first_entered){
		can_shoot = true;
		has_first_entered = true;
	}
}

