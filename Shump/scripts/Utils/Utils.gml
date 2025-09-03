// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro FRAMES 60
#macro HEIGHT_LIMIT 128

enum Alarms {
	Shoot = 0,
	Flash = 1,
	Hitstun = 2,
	Fade = 3
}

function CreateParticle(xx, yy, _xscale, _yscale, _shrink, _angle, _col, _alpha, _descend = false, _ascend = false, _descent_amnt = 0.5, _ascent_amnt = 0.5) {
	var particle = instance_create_layer(xx,yy,"Instances",Particle);
	with (particle) {
		angle = _angle;
		xscale = _xscale;
		yscale = _yscale;
		shrink = _shrink;
		col = _col;
		alpha = _alpha;
		descend = _descend;
		ascend = _ascend;
		descent_speed = _descent_amnt;
		ascent_speed = _ascent_amnt;
		setup = true;
	}
	return particle;
}

function CreateExplosion(_x, _y, _col, _radius = 10, _count = 30) {
	for (var i = 0; i < _count; i++) {
		// Random angle around circle
		var ang = random(360);
		
		// Random radius (sqrt ensures uniform distribution)
		var r = sqrt(random(1)) * _radius;
		
		// Convert polar → Cartesian
		var px = _x + lengthdir_x(r, ang);
		var py = _y + lengthdir_y(r, ang);
		
		// Randomize particle properties
		var p_angle  = ang; // align with radial direction
		var p_scale  = 0.5; 
		var p_shrink = 0.01;
		var p_col    = _col;
		var p_alpha  = 255;

		// Create particle
		with (CreateParticle(px, py, p_scale, p_scale, p_shrink, p_angle, p_col, p_alpha)) {
			// Propel it outward along the same angle
			motion_add(ang, random_range(0.5, 0.9)); 
		}
	}
}

function CreateSmokeDust(_x, _y, _col = GetColorByIndex(global.Colors.DarkGrey), _radius = 5, _count = 15) {
	for (var i = 0; i < _count; i++) {
		// Random angle (so dust can drift any direction)
		var ang = random(360);

		// Radius spread, smaller since dust is more localized
		var r = sqrt(random(1)) * _radius;

		// Position around origin
		var px = _x + lengthdir_x(r, ang);
		var py = _y + lengthdir_y(r, ang);

		// Particle properties (slower + softer than explosion)
		var p_angle  = random(360);    // random spin, doesn’t matter much
		var p_scale  = random_range(0.8, 1.4); // bigger puff sizes
		var p_shrink = 0.0025;         // shrink much slower than explosion
		var p_col    = _col;
		var p_alpha  = 200;            // slightly transparent

		// Create dust particle
		with (CreateParticle(px, py, p_scale, p_scale, p_shrink, p_angle, p_col, p_alpha)) {
			// Gentle outward drift (much slower than explosion)
			motion_add(ang, random_range(0.05, 0.15));

			// Make it fade slowly
			alpha_step = 0.05; // decrease alpha each step
		}
	}
}

/// @param {number} x1  source X
/// @param {number} y1  source Y
/// @param {number} x2  destination X
/// @param {number} y2  destination Y
/// @param {number} xmin  minimum distance step (>0)
/// @param {number} xmax  maximum distance step (>xmin)
/// @param {number} ymin  minimum "side" step (lightning "spread")
/// @param {number} ymax  maximum "side" step (lightning "spread")
/// @returns {int} number of segments drawn.
function draw_lightning(x1, y1, x2, y2, xmin, xmax, ymin, ymax) {
    var _dist = point_distance(x1, y1, x2, y2);
    if (_dist <= 0) return 0;
    
    var _fwd_x = (x2 - x1) / _dist;
    var _fwd_y = (y2 - y1) / _dist;
    var _side_x = -_fwd_y, _side_y = _fwd_x;
    
    var _alpha = draw_get_alpha();
    var _last_x = x1;
    var _last_y = y1;
    var _pos = 0;
    var _drawn = 0;
    repeat (5000) { // line segment limit
        _pos += random_range(xmin, xmax);
        var _next_x, _next_y;
        if (_pos < _dist) {
            var _side_offset = choose(-1, 1) * lerp(ymin, ymax,
                // this instead of just random(1) makes the lightning
                // spread out more close to the middle of it
                random(sin(-pi * _pos / _dist))
            );
            
            _next_x = x1 + _fwd_x * _pos + _side_x * _side_offset;
            _next_y = y1 + _fwd_y * _pos + _side_y * _side_offset;
        } else { // (last point)
            _next_x = x2;
            _next_y = y2;
        }
        
        // you can replace this with custom line drawing - these magic numbers just look alright
        draw_set_alpha(_alpha * 0.3);
        draw_line_width(_last_x, _last_y, _next_x, _next_y, 3.7);
        draw_set_alpha(_alpha * 0.7);
        draw_line_width(_last_x, _last_y, _next_x, _next_y, 1.3);
        
        if (_pos >= _dist) break;
        _last_x = _next_x;
        _last_y = _next_y;
        _drawn += 1;
    }
    draw_set_alpha(_alpha);
    return _drawn;
}

/// sleep(ms)
function sleep(milliseconds) {
	var endTime = get_timer() + (milliseconds*1000);
	do {
	} until(get_timer() >= endTime);
}

/// @function squash_and_stretch(inst, target_xscale, target_yscale, duration)
function squash_and_stretch(inst, target_xscale, target_yscale, duration) {
    var tween = {
        target    : inst,
        orig_x    : inst.image_xscale,
        orig_y    : inst.image_yscale,
        target_x  : target_xscale,
        target_y  : target_yscale,
        duration  : duration,
        timer     : 0
    };

    array_push(global.tweens, tween);
}

function seconds_to_frames(seconds) {
    var result = seconds * FRAMES;
    return result;
}

function frames_to_seconds(frames) {
    var result = frames / FRAMES;
    return result;
}

function int_to_real_seconds(_number) {
	return _number * 60;
}
