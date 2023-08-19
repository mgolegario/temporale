function player_state_free () {
	
#region CONTROLES

var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_space);
var _key_jump_hold = keyboard_check(vk_space);
var _key_shoot = keyboard_check_pressed(vk_up);

#endregion



#region MOVIMENTAÇÃO 

// EIXO DO X

move = _key_right - _key_left != 0;


if (move) {

sprite_index = spr_player_run;
image_speed = 0.5;
move_dir = point_direction(0,0,_key_right - _key_left,0);
move_spd = approach(move_spd, move_spd_max, acc);
obj_SFX.walk_sound_loop = true;
}else{

sprite_index = spr_player_idle;
image_speed = 0.5;
move_spd = approach(move_spd, 0, dcc);
}

hspd = lengthdir_x(move_spd, move_dir);

 if (hspd!= 0) {
	image_xscale = sign(hspd)*x_scale;
	
 }

// FIM EIXO DO X



// EIXO DO Y

vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

// FIM EIXO DO Y



// PULO


ground = place_meeting(x, y+1, obj_wall);

if (ground) {
	coyote_time=coyote_time_max;

}else {

	coyote_time--;
	if (vspd<=0) {
	
	sprite_index = spr_player_jump;	
	alarm [0]= 10;



}else if(vspd>0){
	sprite_index = spr_player_fall;	

	}
}



if(_key_jump and coyote_time > 0){
	coyote_time=0;
	vspd=0;
	vspd-=jump_height;
	obj_SFX.jump_snd = true;
}

if(!_key_jump_hold && vspd <0) {
	
	vspd = max(vspd, -jump_height /2);
	
}


//FIM PULO



// JOGAR BOOMERANG

if (_key_shoot){
	
	if (!instance_exists(obj_boomerang))
instance_create_layer(x+sign(x_scale)*25, y-50, "Instances", obj_boomerang);

}

// FIM BOOMERANG


// ESCORREGAR NA RAMPA APOS CERTA ALTURA

if (sprite_index== spr_player_fall && vspd>14) {
	global.caiu_alto =true;
	alarm [1]= 10;

}else {
	global.caiu_alto=false;

}
//FIM ESCORREGAR RAMPA APOS CERTA ALTURA




#endregion

}


function player_state_slide_right () {

move_dir = point_direction(0,0,-1,0);
hspd = lengthdir_x(7, move_dir);
image_xscale =abs(x_scale)*-1;

}


function player_state_slide_left () {

move_dir = point_direction(0,0,1,0);
hspd = lengthdir_x(7, move_dir);
image_xscale =abs(x_scale);

}