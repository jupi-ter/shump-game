// DRAW GUI
//var color = c_black;
//draw_rectangle_color(0, 96, 128, 128, color,color,color,color, false);
// DRAW HUD
//draw_sprite_ext(sprHUDBase,0,0,96,1,1,0,c_white,1);

//hp and bombs
draw_sprite(sprHeart, 0, 108, 113);
draw_sprite(sprBomb, 0, 9, 113);

//instead do a loop that draws every heart and bomb from bottom to top?
if (instance_exists(Player)) {
	draw_text(118,113,string(Player.hp));
	draw_text(19,113,string(Player.bombs));
}



//score
draw_set_font(FonteFudida);
draw_set_color(GetColorByIndex(global.Colors.White));
draw_text(10,10, string(score));
