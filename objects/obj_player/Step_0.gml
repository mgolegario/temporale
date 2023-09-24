if(global.pause &&  place_meeting(x, y+1, obj_wall)) {
	
	global.paused= true;
	image_speed=0;
	vspd=0;
	hspd=0;

	exit;

}

global.paused= false;

image_speed= 1;

if state= player_state_slide_left or state= player_state_slide_right{


	if (!place_meeting(x+sign(hspd), y+2, obj_wall) ) { 

		if(!place_meeting(x+sign(hspd), y+4, obj_wall)){

		
		state=player_state_free;


		}
	}
}





state();