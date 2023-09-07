estado= noone;
tempo_estado= 500;
timer_estado= 0;

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
estou_perseguindo= false;
muda_estado = function(_estado){

	
	
	if (timer_estado == tempo_estado or tempo_estado <=0) {
	
		estado = _estado[irandom(array_length(_estado)-1)];
		tempo_estado = 500;
		
	}else{
		
	tempo_estado--;
	timer_estado= irandom(tempo_estado);
	
	};

}




estado_parado= function(){
	

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


	muda_estado([estado_parado, estado_passeando]);	

}


estado_persegue= function(){

if (instance_exists(alvo)){

var _dir= point_direction(x, y, alvo.x, alvo.y);

sprite_index= spr_enemy1_run;


hspd= lengthdir_x(move_spd_max, _dir);
vspd= lengthdir_y(move_spd_max, _dir);

image_xscale= sign(_dir) * x_scale;

estou_perseguindo= true;

var _dist= point_distance(x, y, alvo.x, alvo.y); 

if (_dist<5) estado= prepara_ataque;


if (_dist>larg_visao*2) alvo=noone;


}else{
	
muda_estado([estado_parado, estado_passeando]);	

}

}

prepara_ataque = function(){


static _sat=0;

_sat++;



image_blend= make_color_hsv(255, _sat, 255);

hspd=0;
vspd=0;
sprite_index= spr_enemy1_idle;

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