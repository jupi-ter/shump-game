/// @description Insert description here
// You can write your code in this editor
damage = 0;
myColor = global.Colors.White;
is_collision_active = true;
set_speed = speed;

if (instance_exists(UberEnemies)) {
	array_push(global.enemy_entities, self);
}