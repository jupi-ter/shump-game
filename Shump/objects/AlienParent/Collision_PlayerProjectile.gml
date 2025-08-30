/// @description Insert description here
// You can write your code in this editor
hp-=other.damage;

//squash and stretch
var _xscale = 2;
var _yscale = 2;

//squash_stretch(self, _xscale, _yscale, 1);

//flash white
flash = true;

alarm[Alarms.Flash] = 5;

with (other) { instance_destroy(); }
if (hp<=0) {
	instance_destroy();
}