/// @description Insert description here
// You can write your code in this editor
hp-=1;
//squash and stretch
image_xscale = 1.4;
image_yscale = 0.9;
//flash white
sprite_index = myHitSprite;
alarm[1] = 5;
with (other) { instance_destroy(); }
if (hp<=0) {
	instance_destroy();
}