estado= noone;
tempo_estado= 500;
timer_estado= 0;

life=3;

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
move_spd_max= 5.0;
acc = 0.45;
dcc = 0.45;

y_scale = 4;
x_scale = 4;

larg_visao= 200;
alt_visao= sprite_height;
alvo= noone;

colisao_inimigo= false;

duracao_ataque=1;
tempo_ataque=duracao_ataque;

duracao_parado=4;
tempo_parado=duracao_parado;
var _morreu= false;
var _esfumacou= false;
	
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
	show_debug_message(_morreu)
	show_debug_message(_esfumacou)
	sprite_index=spr_enemy_death;
	
	if (image_index>= image_number-1)&& !_morreu{ 
		_morreu= true;	
	
	
	if _morreu sprite_index=spr_enemy_fade_out;
 
	if (image_index>= image_number-1)&& !_esfumacou{ 
		_esfumacou= true;	
		image_index=14;
		image_speed=0;
	}
	}
 
 
	
 if _esfumacou instance_destroy();
	
 
 
}




estado_parado= function(){

	
	sprite_index= spr_enemy1_idle;
	muda_estado([estado_passeando, estado_parado]);
	move=0;
	
	alvo= campo_visao(larg_visao, alt_visao, image_xscale/4)
	
	if (alvo) {
	estado= estado_persegue
	
	}
	
}



estado_passeando= function() {

	
	if  move=0{
		move = irandom(2);
		if move=1 move=-1;
		if move=2 move=1;
	}


		sprite_index = spr_enemy1_run;
		image_speed = 0.5;
		move_dir = point_direction(0,0,move,0);
		move_spd = approach(move_spd, move_spd_max, acc);


hspd = lengthdir_x(move_spd, move_dir);

	

	if (hspd!= 0) {
		image_xscale = sign(hspd)*x_scale;
	

	}
	
	alvo= campo_visao(larg_visao, alt_visao, image_xscale/4)
	
	if (alvo) {
	estado= estado_persegue
	
	}

	muda_estado([estado_parado, estado_passeando]);	

}


estado_persegue= function(){


	if (instance_exists(alvo)){

		var _dir= point_direction(x, y, alvo.x, alvo.y);

		sprite_index= spr_enemy1_run;


		hspd= lengthdir_x(move_spd_max, _dir);
		


		image_xscale= sign(hspd) * x_scale;




		var _dist= point_distance(x, y, alvo.x, alvo.y); 

		if (_dist< larg_visao/2) estado= estado_prepara_ataque;


		if (_dist>larg_visao*2) alvo=noone;


	}else{
	
		muda_estado([estado_parado, estado_passeando]);	

	}

}

estado_prepara_ataque = function(){

	
	estou_atacando=true;
	sprite_index= spr_enemy1_idle;

	if sat<2{
	
		sat+= (delta_time/2000000);
	}

	image_speed = sat;

	hspd=0;
	vspd=0;

	if sat>1.8 {
		estado=estado_ataque;
		alvo_dir=point_direction(x,y, alvo.x, alvo.y);
		sat= 0;
		image_speed=1;
	}

}



estado_ataque = function(){
	


	tempo_ataque -= delta_time/1000000;

	hspd= lengthdir_x(move_spd_max*2, alvo_dir);

	

if image_index>4{
if (!instance_exists(obj_enemy_hitbox)){

instance_create_layer(x+(70*(image_xscale/4)),y,layer,obj_enemy_hitbox);

}


}



sprite_index=spr_enemy1_attack;
image_speed=1;
hspd=0;	
vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);

 if (image_index>= image_number-1){ 
	
estado=estado_parado;
		sprite_index=spr_enemy1_idle;
		tempo_ataque=duracao_ataque;
	if (instance_exists(obj_enemy_hitbox)) instance_destroy(obj_enemy_hitbox);
	
 }


}


campo_visao = function (_largura, _altura, _xscale){

	var _x1, _x2, _y1, _y2;
	_x1= x;
	_y1= y + _altura/2 - sprite_height /2;
	_x2= _x1 + _largura * image_xscale/4;
	_y2= _y1 - _altura;


	draw_rectangle(_x1, _y1, _x2, _y2, false);

	var _alvo = collision_rectangle(_x1, _y1, _x2, _y2, obj_player, 0, 1);

	return _alvo;

}


estado= estado_parado;