// DRAW GUI
//var color = c_black;
//draw_rectangle_color(0, 96, 128, 128, color,color,color,color, false);
// DRAW HUD
//draw_sprite_ext(sprHUDBase,0,0,96,1,1,0,c_white,1);
draw_set_font(FonteFudida);
draw_set_color(GetColorByIndex(global.Colors.White));

if (instance_exists(Player)) {
	var heart_x = 8;
	var bomb_x = 112;
	var icons_y = 120;
	draw_sprite(sprHeart, 0, heart_x, icons_y);
	draw_sprite(sprBomb, 0, bomb_x, icons_y);
	draw_text(heart_x+sprite_get_width(sprHeart) * 0.5, icons_y, string(Player.hp));
	draw_text(bomb_x+sprite_get_width(sprHeart) * 0.5, icons_y, string(Player.bombs));
}

draw_text(5,5, string(actual_score));

var bar_x = 5;
var bar_y = 15;
var offset_x_1 = 1;
var offset_y_1 = 1;
var offset_x_2 = 17;
var offset_y_2 = 3;

draw_sprite(sprBar, 0, bar_x, bar_y); //sprite is 19px wide 5px tall, actual space we would have to cover is between (1,1) and (17, 3) of the sprite.
// XP ratio (how full the bar should be)
var xp_ratio = clamp(current_xp / xp_goal, 0, 1);

// Calculate the fill width (inside the bar’s boundaries)
var bar_left   = bar_x + offset_x_1;  // sprite x + 1px offset
var bar_top    = bar_y + offset_y_1; // sprite y + 1px offset
var bar_right  = bar_x + offset_x_2; // sprite x + 17px offset
var bar_bottom = bar_y + offset_y_2; // sprite y + 3px offset

var fill_width = lerp(bar_left, bar_right, xp_ratio);
var bar_color = GetColorByIndex(Colors.White);

if (xp_ratio < 0.25) {
    bar_color = GetColorByIndex(Colors.Red);
} else if (xp_ratio < 0.5) {
    bar_color = GetColorByIndex(Colors.Orange);
} else if (xp_ratio < 0.75) {
    bar_color = GetColorByIndex(Colors.Yellow);
} else {
    bar_color = GetColorByIndex(Colors.Green);
}

// Draw the filled portion
draw_rectangle_color(
    bar_left, bar_top,
    fill_width, bar_bottom,
    bar_color, bar_color, bar_color, bar_color, false
);

if (display_boon_text) {
	draw_set_alpha(0.5);
	var color = c_black;
	draw_rectangle_color(0,0,128,128,color,color,color,color,false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_text(64, 24, "choose an upgrade!");
	if (current_upgrade != undefined) {
		draw_text(64, 30, string_lower(current_upgrade.name));
		draw_text(64, 36, string_lower(current_upgrade.description));
		//draw choices
		for (i = 0; i < choices; i++) {
			draw_set_halign(fa_left);
			//draw button
			var button_offset = choice_display_xstart + choice_display_offset * i;
			draw_sprite(sprButton, 0, button_offset, choice_display_y);
			//draw upgrade sprite
			//todo: change this to the random upgrade, currently just use the global list.
			var upgrade_to_display = global.upgrade_pool[i];
			draw_sprite(upgrade_to_display.sprite, 0, button_offset, choice_display_y);
		}
		draw_set_halign(fa_left);
		draw_sprite(sprArrow, 0, choice_display_xstart + choice_display_offset * choice_idx, choice_arrow_y);
	}
}





