/// @description Insert description here
// You can write your code in this editor

sleep(20);

CreateExplosion(x,y,GetColorByIndex(myColor));
CreateSmokeDust(x,y);


if (instigator != noone) {
	var payload = {
    	score_amount: reward,
    	source: "player"
	};
	EventManager.trigger(global.EventNames.AlienHit, payload);
}

//create scrap
var range = 3;
repeat (xp_yield) {
	instance_create_layer(x + random_range(-range,range), y+random_range(-range, range) , "Instances", Scrap);
}

//maintain this here for now
if (instance_exists(UberCont) and instigator != noone) {
	with (UberCont) {
		total_kills++;
		temp_kills++;
	}
}
