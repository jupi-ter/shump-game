/// @description Insert description here
// You can write your code in this editor

CreateExplosion(x,y,GetColorByIndex(myColor));
sleep(10);

if (instance_exists(UberCont)) {
	with (UberCont) {
		score += other.reward;
		current_xp += other.xp_yield;
		total_kills++;
		temp_kills++;
	}
}
