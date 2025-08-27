/// @description Insert description here
// You can write your code in this editor
if (flash) {
	shader_set(sha_flash);
	draw_self();
	shader_reset();
} else {
	draw_self();
}