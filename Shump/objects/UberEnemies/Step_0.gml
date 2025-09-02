var count = array_length(global.enemy_entities);

if (instance_exists(Player) and Player.bombs > 0 and keyboard_check_pressed(ord("X"))) {
	Player.bombs--;
	for (var i = count - 1; i >= 0; i--) {
		var enemy = global.enemy_entities[i];
		enemy.instigator = Player.id;
		instance_destroy(enemy);
		array_delete(global.enemy_entities, i, 1);
	}
}