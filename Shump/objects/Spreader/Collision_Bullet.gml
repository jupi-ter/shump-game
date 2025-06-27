/// @description Insert description here
// You can write your code in this editor
hp-=1;
with (other) { instance_destroy(); }
if (hp<=0) {
	CreateExplosion(x,y,8,GetColorByIndex(global.Colors.Red));
	instance_destroy();
}