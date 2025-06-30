/// @description Insert description here
// You can write your code in this editor
hp-=1;
//squash and stretch
image_xscale = 0.9;
image_yscale = 1.4;
//flash white
sprite_index = sprShipWhite;
alarm[1] = 5;
with (other) { instance_destroy(); }
if (hp<=0) {
	CreateExplosion(x,y,8,GetColorByIndex(global.Colors.DarkGrey));
	instance_destroy();
}