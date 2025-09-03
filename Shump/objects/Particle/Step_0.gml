/// @description Insert description here
// You can write your code in this editor

if (setup) {
	if (xscale > 0) {
		xscale -= shrink;
		yscale -= shrink;
	} else {
		instance_destroy();
	}
	
	if (alpha_step != 0) {
		if (image_alpha > 0) image_alpha -= alpha_step;
		else instance_destroy();
	}
}

// Movement smoothing
if (descend) {
    target_y = y + descent_speed; // next intended position
}
if (ascend) {
    target_y = y - ascent_speed;
}

// If no ascend/descend active, keep target where it is
if (!ascend && !descend) {
    target_y = y;
}

// Smoothly approach target_y
y += (target_y - y) * smoothing_factor; // <-- 0.1 = smoothing factor