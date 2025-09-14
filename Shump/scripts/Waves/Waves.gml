// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wave(_wave_number, _enemy_pool, _is_boss, _enemy_amount, _boss) {
    return {
        wave_number: _wave_number,
        enemy_pool: _enemy_pool,
		enemy_amount: _enemy_amount,
        is_boss: _is_boss,
        boss: _boss
    };
}

/// @function GenerateWave(_wave_number)
/// @desc Returns a wave struct with balanced scaling, themes, and bosses.

function GenerateWave(_wave_number) {
    var pool = [];
    var is_boss = false;
    var boss = noone;
    var enemy_amount = 0;

    // 1. Boss waves every 5th
    if (_wave_number mod 5 == 0) {
        is_boss = true;
        //commented since we dont have bosses yet
        //boss = BossEnemy; // swap in your real boss
        //return Wave(_wave_number, [boss], true, 1, boss);
    }

    // 2. Enemy pool unlock progression
    if (_wave_number >= 1) array_push(pool, GreenGuy);
    if (_wave_number >= 2) array_push(pool, OrangeGuy);
    if (_wave_number >= 3) array_push(pool, Spreader);
    if (_wave_number >= 4) array_push(pool, Squid);
    if (_wave_number >= 6) array_push(pool, YellowGuy);

    // 3. Enemy amount scaling curve
    if (_wave_number <= 3) {
        enemy_amount = 5 + (_wave_number - 1) * 5; // gentle start
    } else if (_wave_number <= 7) {
        enemy_amount = irandom_range(12, 20); // mid-game plateau
    } else {
        enemy_amount = irandom_range(18, 25); // late game swarm cap
    }

    // 4. Breather waves (every 4th non-boss wave = easier)
    if (_wave_number mod 4 == 0) {
        enemy_amount = max(5, enemy_amount div 2);
    }

    // 5. Themed waves (focus on one or two types)
    var theme_chance = random(1);
    if (theme_chance < 0.3 && array_length(pool) > 1) {
        // Pick 1–2 enemy types for this wave
        var themed_pool = [];
        array_push(themed_pool, pool[irandom(array_length(pool) - 1)]);
        if (choose(true, false)) array_push(themed_pool, pool[irandom(array_length(pool) - 1)]);
        pool = themed_pool;
    }

    return Wave(_wave_number, pool, is_boss, enemy_amount, boss);
}
