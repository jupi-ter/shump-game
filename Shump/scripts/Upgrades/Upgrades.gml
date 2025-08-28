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
    Upgrade("Damage Up", "Increase bullet damage by 2.", function(player) {
        player.damage += 2;
    }),
    
    Upgrade("Fire Rate", "Increase fire rate by 15%.", function(player) {
        player.fire_rate *= 0.85;
    }),
    
    Upgrade("Extra Life", "Gain +1 life.", function(player) {
        player.lives += 1;
    }),
    
    Upgrade("Spread Shot", "Bullets fire in 3-way spread.", function(player) {
        player.shoot_mode = "spread";
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