// DRAW GUI
var color = c_black;
draw_rectangle_color(0, 96, 128, 128, color,color,color,color, false);
// DRAW HUD
draw_sprite_ext(sprHUDBase,0,0,96,1,1,0,c_white,1);

//hp and bombs
draw_sprite(sprHeart, 0, 9, 103);
if (instance_exists(Player)) {
	draw_text(19,103,string(Player.hp));
	draw_text(19,113,string(Player.bombs));
}
draw_sprite(sprBomb, 0, 9, 113);

//score
draw_set_font(WeiholmirFont);
draw_set_color(GetColorByIndex(global.Colors.White));
//i need to know WHEN an alien dies, get its reward and display subscore only when an alien dies.
if (display_subscore) {
	draw_text(44,114, "+" + string(subscore));
}
draw_text(44,103,string(score));

