/// @description Insert description here
// You can write your code in this editor
if (!bool_hitstun and other.is_collision_active) {
	bool_hitstun = true;
	hp-=other.damage;
	CreateExplosion(x,y,GetColorByIndex(other.myColor));
	//squash and stretch
	image_xscale = 0.9;
	image_yscale = 1.4;
	//flash white
	sprite_index = sprShipWhite;
	alarm[1] = 7;
	
	with (other) { instance_destroy(); }
	
	if (hp<=0) {
		CreateExplosion(x,y,GetColorByIndex(global.Colors.DarkGrey));
		instance_destroy();
	}
}