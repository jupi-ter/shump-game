/// @description Insert description here
// You can write your code in this editor
hp-=other.damage;

//squash and stretch
var _xscale = 1.5;
var _yscale = 0.9;
var flash_and_squash_timer_in_frames = 5; //FRAMES

squash_and_stretch(self, _xscale, _yscale, frames_to_seconds(flash_and_squash_timer_in_frames));

//flash white
flash = true;

alarm[Alarms.Flash] = flash_and_squash_timer_in_frames; //FRAMES 

if (hp<=0) {
	instigator = other.parent_instance;
	instance_destroy();
}

with (other) { instance_destroy(); }