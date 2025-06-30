// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateParticle(xx, yy, _xscale, _yscale, _shrink, _angle, _col, _alpha) {
	var particle = instance_create_layer(xx,yy,"Instances",Particle);
	with (particle) {
		angle = _angle;
		xscale = _xscale;
		yscale = _yscale;
		shrink = _shrink;
		col = _col;
		alpha = _alpha;
		setup = true;
	}
	return particle;
}

function CreateExplosion(xx, yy, amount, _col) {
	var ring_value = 360 / amount;
	for (i = 0; i < amount; i++) {
		with (CreateParticle(xx, yy, 1, 1, 0.05, i * ring_value, _col, 1)) {
			motion_add(angle, 0.5);
		}
	}
}