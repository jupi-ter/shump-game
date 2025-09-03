/// @description Fade alarm
if (blink < 0) {
    blink = hitstun_timer;
    visible = true;
    bool_hitstun = false;
} else {
    blink --;
    visible = !visible;
    alarm[Alarms.Fade] = 2;
}