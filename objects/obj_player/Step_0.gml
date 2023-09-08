if(global.pause &&  place_meeting(x, y+1, obj_wall)) {
	
	global.paused= true;
	image_speed=0;
	vspd=0;
	hspd=0;
	exit;

}

global.paused= false;
image_speed= 1;

state();

show_debug_message(state);

if life<=0 {
	
	sprite_index=spr_player_attack;
	tempo_morto-= delta_time/1000000;
	
	
}
	
	show_debug_message(opacidade);