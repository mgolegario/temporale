estado= noone;
tempo_estado= 500;
timer_estado= 0;


muda_estado = function(_estado){

	
	
	if (timer_estado == tempo_estado or tempo_estado <=0) {
	
		estado = _estado;
		tempo_estado = 500;
	}else{
		
	tempo_estado--;
	timer_estado= irandom(tempo_estado);
	
	};

}




estado_parado= function(){
	
	image_blend=c_black
	muda_estado(estado_passeando);
}

estado_passeando= function() {
	
	image_blend=c_red;
	muda_estado(estado_parado);	

}

//estado inicial

estado= estado_parado;