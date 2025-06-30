/// @description Insert description here
// You can write your code in this editor

camera_set_view_pos(view_camera[0], random(shake)-shake/2, random(shake)-shake/2); 

if (shake > 10)
shake *= 0.8;
if (shake > 0)
shake -= 1;
else
shake = 0;