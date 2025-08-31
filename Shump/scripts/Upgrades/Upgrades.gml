// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Upgrade(_name, _desc, _apply_func, _sprite = sprBullet) {
    return {
        name: _name,
        description: _desc,
		sprite: _sprite,
        apply: _apply_func
    };
}

global.upgrade_pool = [
    Upgrade("Fire Rate", "Increase fire rate by 15%.", function(Player) {
        Player.fire_rate *= 0.85;
    }),
    
    Upgrade("Extra Life", "Gain +1 life.", function(Player) {
        Player.hp++;
    }),
    
	Upgrade("Extra Bullet", "Gain +1 bullet.", function(Player) {
        Player.bullet_amount++;
    })
];


/*
Step 3: Applying Upgrades

The player object (or a game manager) can hold a list of acquired upgrades.

// player create event
upgrades = [];
damage = 5;
fire_rate = 1.0; // lower = faster
lives = 3;
shoot_mode = "normal";

When picking an upgrade:
/// player_get_upgrade(index)
var upg = global.upgrade_pool[index];
array_push(upgrades, upg);
upg.apply(self);

Step 5: Optional — Categories & Random Selection

Use an enum or string category to sort upgrades (offense, defense, utility, special).
Then when presenting choices, pick randomly from the pool by category.
*/