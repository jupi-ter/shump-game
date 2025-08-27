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

global.wave_list = [
	Wave(1, [GreenGuy], false, 5 ,noone),
	Wave(2, [GreenGuy, OrangeGuy], false, 10 , noone),
	Wave(3, [GreenGuy, OrangeGuy, Spreader], false, 15 , noone),
	Wave(4, [GreenGuy, OrangeGuy, Spreader, Squid], false, 20 , noone),
	Wave(5, [GreenGuy, OrangeGuy, Spreader, Squid, YellowGuy], false, 25, noone),
];
