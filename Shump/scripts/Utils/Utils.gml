// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateParticle(xx, yy, _xscale, _yscale, _shrink, _angle, _col, _alpha){
	show_debug_message("entro en particle");
	with (instance_create_layer(xx,yy,"Instances",Particle)) {
		motion_add(_angle, 0.5);
		angle = 0;
		xscale = _xscale;
		yscale = _yscale;
		shrink = _shrink;
		col = _col;
		alpha = _alpha;
		setup = true;
	}
}

function CreateExplosion(xx, yy, amount, _col) {
	show_debug_message("entro en explosion");
	var ring_value = 360 / amount;
	for (i = 0; i < amount; i++) {
		CreateParticle(xx, yy, 1, 1, 0.05, i * ring_value, _col, 1);
	}
}