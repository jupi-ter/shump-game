/// @description Insert description here
// You can write your code in this editor

if (setup) {
	if (xscale > 0) {
		xscale -= shrink;
		yscale -= shrink;
	} else {
		instance_destroy();
	}
}

if (descend) {
	y+=descent_speed
}