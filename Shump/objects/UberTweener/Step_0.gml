var count = array_length(global.tweens);
for (var i = count - 1; i >= 0; i--) {
    var tw = global.tweens[i];

    if (!instance_exists(tw.target)) {
        array_delete(global.tweens, i, 1);
        continue;
    }

    tw.timer += delta_time / 1000000;
    var t = tw.timer / tw.duration;

    if (t < 0.5) {
        var f = t * 2;
        tw.target.image_xscale = lerp(tw.orig_x, tw.target_x, f);
        tw.target.image_yscale = lerp(tw.orig_y, tw.target_y, f);
    } else if (t <= 1) {
        var f = (t - 0.5) * 2;
        tw.target.image_xscale = lerp(tw.target_x, tw.orig_x, f);
        tw.target.image_yscale = lerp(tw.target_y, tw.orig_y, f);
    } else {
        tw.target.image_xscale = tw.orig_x;
        tw.target.image_yscale = tw.orig_y;
        array_delete(global.tweens, i, 1);
    }
}