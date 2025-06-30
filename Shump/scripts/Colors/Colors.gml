
enum Colors {
	Black,
	DarkBlue,
	DarkPurple,
	DarkGreen,
	Brown,
	DarkGrey,
	LightGrey,
	White,
	Red,
	Orange,
	Yellow,
	Green,
	Blue,
	Lavender,
	Pink,
	LightPeach
}

function GetColorByIndex(index){
	switch(index) {
		case 0: return make_color_rgb(0, 0, 0);
		case 1: return make_color_rgb(29, 43, 83);
		case 2: return make_color_rgb(126, 37, 83);
		case 3: return make_color_rgb(0, 135, 81);
		case 4: return make_color_rgb(171, 82, 54);
		case 5: return make_color_rgb(95, 87, 79);
		case 6: return make_color_rgb(194, 195, 199);
		case 7: return make_color_rgb(255, 241, 232);
		case 8: return make_color_rgb(255, 0, 77);
		case 9: return make_color_rgb(255, 163, 0);
		case 10: return make_color_rgb(255, 236, 39);
		case 11: return make_color_rgb(0, 228, 54);
		case 12: return make_color_rgb(41, 173, 255);
		case 13: return make_color_rgb(131, 118, 156);
		case 14: return make_color_rgb(255, 119, 168);
		case 15: return make_color_rgb(255, 204, 170);
	}
}

//1 		#1D2B53 	29, 43, 83 	dark-blue
//2 		#7E2553 	126, 37, 83 	dark-purple
//3 		#008751 	0, 135, 81 	dark-green
//4 		#AB5236 	171, 82, 54 	brown
//5 		#5F574F 	95, 87, 79 	dark-grey
//6 		#C2C3C7 	194, 195, 199 	light-grey
//7 		#FFF1E8 	255, 241, 23 	white
//8 		#FF004D 	255, 0, 77 	red
//9 		#FFA300 	255, 163, 0 	orange
//10 		#FFEC27 	255, 236, 39 	yellow
//11 		#00E436 	0, 228, 54 	green
//12 		#29ADFF 	41, 173, 255 	blue
//13 		#83769C 	131, 118, 156 	lavender
//14 		#FF77A8 	255, 119, 168 	pink
//15 		#FFCCAA 	255, 204, 170 	light-peach