if(global.pause &&  place_meeting(x, y+1, obj_wall)) {
	
	global.paused= true;
	image_speed=0;
	vspd=0;
	hspd=0;
	exit;

}

global.paused= false;
image_speed= 1;



if (place_meeting(x+6, y-2, obj_slope_right) && global.caiu_alto){
		
	state= player_state_slide_right();

}else if (place_meeting(x-6, y-2, obj_slope_left) && global.caiu_alto){
		
	state= player_state_slide_left();


}else {
	
	state=player_state_free();

}



move_camera();