estado= noone;
tempo_estado= 500;
timer_estado= 0;
exclamacao_altura=1;
life=20;

tempo_morto=5;

sat= 0;

vspd = 0;
vspd_min = -14;
vspd_max = 35;
grv = 0.5;

hspd=0;
move=0;
move_dir = 0;
move_spd = 0;
move_spd_max= 8;
acc = 0.45;
dcc = 0.45;

y_scale = 4;
x_scale = 4;

larg_visao= 2000;
alt_visao= sprite_height;
alvo= noone;

colisao_inimigo= false;

duracao_ataque=1;
tempo_ataque=duracao_ataque;

duracao_parado=4;
tempo_parado=duracao_parado;

morreu= false;
	dormindo=true;
	
	
muda_estado = function(_estado){

	
	
	if (timer_estado == tempo_estado or tempo_estado <=0) {
	
		estado = _estado[irandom(array_length(_estado)-1)];
		tempo_estado = 500;
		
	}else{
		
	tempo_estado--;
	timer_estado= irandom(tempo_estado);
	
	};

}


estado_morto= function(){
	
	image_speed=1;


	sprite_index=spr_dinoBoss_death;
	
	if (image_index>= image_number-1)&& !morreu{ 
		morreu= true;
	
	}

	if morreu && tempo_morto>0{
	
		image_speed=0; 
		image_index=4;
	}
 
}





estado_dormindo= function(){

if dormindo or !instance_exists(alvo) or obj_player.state=player_state_dead{
	sprite_index= spr_DinoBoss_sleep;
	move=0;




	alvo= campo_visao(larg_visao, alt_visao, image_xscale/4)
	
	if (alvo) and obj_player.state!=player_state_dead {
		dormindo=false;
		
	}

}	
	
	if !dormindo {
	sprite_index=spr_DinoBoss_levanta;
	if (image_index>= image_number-1) {dormindo=true;estado= estado_persegue;};  
	}
}



estado_passeando= function() {

	
	if  move=0{
		move = irandom(2);
		if move=1 move=-1;
		if move=2 move=1;
	}


		sprite_index = spr_dinoBoss_run;
		image_speed = 0.5;
		move_dir = point_direction(0,0,move,0);
		move_spd = approach(move_spd, move_spd_max, acc);


hspd = lengthdir_x(move_spd, move_dir);

	

	if (hspd!= 0) {
		x_scale = sign(hspd)*4;
	

	}
	
	alvo= campo_visao(larg_visao, alt_visao, x_scale/4)
	
	if (alvo) {
	
	estado= estado_persegue
	
	}


}


estado_persegue= function(){


	if (instance_exists(alvo) and obj_player.state!=player_state_dead){

		var _dir= point_direction(x, y, alvo.x, alvo.y);

		sprite_index= spr_dinoBoss_run;


		hspd= lengthdir_x(move_spd_max, _dir);
		


		x_scale= sign(hspd) * 4;




		var _dist= point_distance(x, y, alvo.x, alvo.y); 

		if (_dist< larg_visao/10) estado=estado_prepara_ataque;


		if (_dist>larg_visao/1) alvo=noone;


	}else{	
	dormindo=true;	
	estado=estado_dormindo;

	}
}
estado_prepara_ataque = function(){

	
	estou_atacando=true;
	sprite_index= spr_dinoBoss_idle;

	if sat<=1{
	
		sat+= (delta_time/2000000);
	}


	hspd=0;
	vspd=0;

	if sat>=0.3 {
		estado=estado_ataque;
		alvo_dir=point_direction(x,y, alvo.x, alvo.y);
		sat= 0;
		image_speed=1;
	}

}



estado_ataque = function(){
	
image_speed=1;

	tempo_ataque -= delta_time/1000000;



if image_index>0{
if (!instance_exists(obj_dino_hitbox)){

instance_create_layer(x+(100*(x_scale/4)),y,layer,obj_dino_hitbox);

}


}


	sprite_index=spr_dinoBoss_attack;


hspd=0;	
vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

 if (image_index>= image_number-1){ 
	
estado=estado_persegue;
		sprite_index=spr_dinoBoss_idle;
		tempo_ataque=duracao_ataque;
	if (instance_exists(obj_dino_hitbox)) instance_destroy(obj_dino_hitbox);
	
 }


}


campo_visao = function (_largura, _altura, _xscale){

	var _x1, _x2, _y1, _y2;
	_x1= x- (200* x_scale/4);
	_y1= y + _altura/2 - sprite_height /2;
	_x2= _x1 + _largura * x_scale/4;
	_y2= _y1 - _altura;


	draw_rectangle(_x1, _y1, _x2, _y2, false);

	var _alvo = collision_rectangle(_x1, _y1, _x2, _y2, obj_player, 0, 1);

	return _alvo;

}



estado= estado_dormindo;