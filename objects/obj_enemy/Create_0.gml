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
move_spd_max= 7.0;
acc = 0.45;
dcc = 0.45;

y_scale = 4;
x_scale = 4;


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

//estado inicial

estado= estado_parado;