
event_inherited();

hitbox = instance_create_layer(x,y,"Instances", LightningHitbox);
instance_deactivate_object(hitbox);

myColor = global.Colors.Yellow;
mySprite = sprYellowGuy;
myHitSprite = sprYellowGuyFlash;
lightning = false;
laser_timer = 30;