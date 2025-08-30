
if (!bool_hitstun and other.is_collision_active) {
	bool_hitstun = true;
	
	hp-=other.contact_damage;
	
	//squash and stretch
	var _xscale = 1.5;
	var _yscale = 0.9;

	squash_and_stretch(self, _xscale, _yscale, frames_to_seconds(flash_and_squash_timer_in_frames));

	//flash white
	flash = true;

	alarm[Alarms.Flash] = flash_and_squash_timer_in_frames;
	alarm[Alarms.Hitstun] = 10;

	if (hp<=0) {
		CreateExplosion(x,y,GetColorByIndex(global.Colors.DarkGrey));
		instance_destroy();
	}
}

