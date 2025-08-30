
if (!bool_hitstun and other.is_collision_active) {
	bool_hitstun = true;
	
	hp-=other.contact_damage;
	
	//squash and stretch
	image_xscale = 0.9;
	image_yscale = 1.4;
	
	//flash white
	flash = true;
	alarm[Alarms.Flash] = 7;
	alarm[Alarms.Hitstun] = 10;

	if (hp<=0) {
		CreateExplosion(x,y,GetColorByIndex(global.Colors.DarkGrey));
		instance_destroy();
	}
}

