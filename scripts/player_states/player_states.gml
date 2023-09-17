function player_state_free () {


// EIXO DO X

move = input_check("right") - input_check("left") != 0;


if (move) {

sprite_index = spr_player_run;
image_speed = 0.5;
move_dir = point_direction(0,0,input_check("right") - input_check("left"),0);
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



if(input_check_pressed("jump") and coyote_time > 0){
	coyote_time=0;
	vspd=0;
	vspd-=jump_height;
	obj_SFX.jump_snd = true;
}

if(!input_check("jump") && vspd <0) {
	
	vspd = max(vspd, -jump_height /2);
	
}


//FIM PULO


// ESCORREGAR NA RAMPA APOS CERTA ALTURA

if (sprite_index== spr_player_fall && vspd>14) {
	global.caiu_alto =true;
	alarm [1]= 10;

}else {
	global.caiu_alto=false;

}
//FIM ESCORREGAR RAMPA APOS CERTA ALTURA


if input_check_pressed("attack") and ground{

image_index=0;
move_spd=0;
hspd=0;
state= player_state_attack;

}



	if life<=0 {
	state=player_state_dead;
	move_spd=0;
	hspd=0;


	}
	
	
if (place_meeting(x+6, y-2, obj_slope_right) && global.caiu_alto){
		
	state= player_state_slide_right;

}else if (place_meeting(x-6, y-2, obj_slope_left) && global.caiu_alto){
		
	state= player_state_slide_left;


}



}

function player_state_dead(){
	
	vspd+=grv;
	vspd = clamp(vspd, vspd_min, vspd_max);
	var _morreu= false;
	sprite_index=spr_player_death;
	
	if (image_index>= image_number-1)&& !_morreu{ 
		_morreu= true;	
	}
 
	if _morreu {
	 
		image_speed=0; 
		image_index=11;
	
	}
 
	tempo_morto-= delta_time/1000000;
	

}
	





	
function player_state_attack(){


if image_index>2{
if (!instance_exists(obj_player_hitbox)){

instance_create_layer(x+(52*(image_xscale/4)),y,layer,obj_player_hitbox);

}
}


sprite_index= spr_player_attack;
image_speed=1;

vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

 if (image_index>= image_number-1){ 
	
	state=player_state_free;
	if (instance_exists(obj_player_hitbox)) instance_destroy(obj_player_hitbox);
	
 }


}



function player_state_slide_right () {

move_dir = point_direction(0,0,-1,0);
hspd = lengthdir_x(7, move_dir);
image_xscale =abs(x_scale)*-1;

	if !(place_meeting(x+6, y-2, obj_slope_right) && global.caiu_alto){
		
		state=player_state_free;

	}

}



function player_state_slide_left () {

move_dir = point_direction(0,0,1,0);
hspd = lengthdir_x(7, move_dir);
image_xscale =abs(x_scale);

if !(place_meeting(x-6, y-2, obj_slope_left) && global.caiu_alto){
		
		state=player_state_free;

}

}

function player_state_cutscene1 (){



if levantou==false {sprite_index=spr_player_inicio_cutscene; };
image_speed=0.5;

if levantou==false and (image_index>= image_number-1){ 
	
	
	sprite_index= spr_player_run;

	image_index=0;
    hspd=5;
    levantou=true;
 }


 if !parou and distance_to_object(obj_doutor)<=70{
	hspd=0;
 	image_speed=0.5;
	sprite_index= spr_player_idle;
	parou=true;
	
 }



 
 if !dialogo_finalizado_cut1 and input_check_pressed("dialogo") {

	layer_create(-200,"dialogo");
	instance_create_layer(x,y, "dialogo",obj_texto);

	with obj_texto{
		texto=["Olhe bem meu filho, eu já tenho uma idade bem avançada, então nunca é meio dificil cair numa dessa",
		"tudo bem tudo bem tudo bem tudo bem tudo bem",
		"flw flw flw flw flw flw flw flw"];

		caixa[0,0]=caixa_doutor[0,0];
		caixa[0,1]=caixa_doutor[0,1];
	
	}

 }
 

 

 
  if dialogo_finalizado_cut1==true{
 
	state= player_state_free;
 
 
 }
 
}
