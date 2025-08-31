// DRAW GUI
//var color = c_black;
//draw_rectangle_color(0, 96, 128, 128, color,color,color,color, false);
// DRAW HUD
//draw_sprite_ext(sprHUDBase,0,0,96,1,1,0,c_white,1);

if (instance_exists(Player)) {
	for (i = 0; i < Player.hp; i++) {
		draw_sprite(sprHeart, 0, 8, 113-(sprite_get_width(sprHeart) * i));
	}
	for (i = 0; i < Player.bombs; i++) {
		draw_sprite(sprBomb, 0, 112, 113-(sprite_get_width(sprBomb) * i));
	}
}


//score
draw_set_font(FonteFudida);
draw_set_color(GetColorByIndex(global.Colors.White));

if (!display_boon_text) {
	draw_text(5,5, string(actual_score));
	draw_text(5,15, "xp: " + string(current_xp) + "/" + string(xp_goal));
	draw_text(5,25, "lvl: " + string(level));
} else {
	draw_set_alpha(0.5);
	var color = c_black;
	draw_rectangle_color(0,0,128,128,color,color,color,color,false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_text(64, 24, "choose an upgrade!");
	if (current_upgrade != undefined) {
		draw_text(64, 30, string_lower(current_upgrade.name));
		draw_text(64, 36, string_lower(current_upgrade.description));
	}
}





