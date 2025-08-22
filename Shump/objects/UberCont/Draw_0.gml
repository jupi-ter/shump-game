// DRAW GUI

if (instance_exists(Player)) {
	for (var i = 0; i < Player.hp; i++) {
		draw_sprite(sprHeart, 0, 8+(i*9), 8);
	}
}

draw_set_color(GetColorByIndex(global.Colors.White));
draw_set_font(FonteFudida)
draw_text(8, 16, "SCORE: " + string(score));
draw_text(8, 24, "XP: " + string(current_xp) + "/" + string(xp_goal));
