if (blink < 0) {
    instance_destroy()
} else {
    alarm[Alarms.Fade] = 2;
    blink --;
    visible = !visible;
}