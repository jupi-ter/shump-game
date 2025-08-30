time += 0.05;
counter++;

image_angle = amplitude * sin(time * angle_spd);

y += descent_speed;

var part_base_random_size = random_range(0.5, 0.8);
var range_value = 3;
var shrink_value = 0.01;
var alpha = 1;
var part_generation_divisor = 3;
var y_offset = 3;

//y-2+random_range(-range_value,range_value)

if (counter % part_generation_divisor == 0) {
	CreateParticle(x+random_range(-range_value,range_value), y-y_offset, part_base_random_size, part_base_random_size, shrink_value, random(359), GetColorByIndex(myColor), alpha, false, true, 0.05, 0.25);
}

if (counter >= 60) {
	counter = 0;
}

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

