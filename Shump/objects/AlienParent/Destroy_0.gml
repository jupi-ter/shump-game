/// @description Insert description here
// You can write your code in this editor

CreateExplosion(x,y,GetColorByIndex(myColor));
sleep(10);

if (instigator != noone) {
	var payload = {
    	score_amount: reward,
    	source: "player"
	};
	EventManager.trigger(global.EventNames.AlienHit, payload);
}

//maintain this here for now
if (instance_exists(UberCont) and instigator != noone) {
	with (UberCont) {
		total_kills++;
		temp_kills++;
	}
}
