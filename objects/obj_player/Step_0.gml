if(global.pause &&  place_meeting(x, y+1, obj_wall)) {
	
	global.paused= true;
	image_speed=0;
	vspd=0;
	hspd=0;
	exit;

}

global.paused= false;
image_speed= 1;
show_debug_message(global.dialogo_ja_feito)
state();