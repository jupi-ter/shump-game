
if (instance_exists(Player)) {
    if (distance_to_object(Player) <= attract_radius) {
        //start moving towards player
        move_towards_point(Player.x, Player.y, attract_speed);
    }
}