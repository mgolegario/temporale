if texto_por_fala!= texto[fala]{
indice=1;
texto_por_fala=texto[fala];
if troca_balao=0 troca_balao=1 else troca_balao=0;
}

if (indice <= string_length(texto[fala])){
	
	
	if indice==ceil(indice){
		var _char = string_char_at(texto[fala], indice);
		if _char!=" "{
			obj_SFX.text_snd=true;
		}
	}
	
	indice+=vel_txt;
	
	if (indice+vel_txt>= ceil(indice)){
	indice = ceil(indice);
	
	}

}


 
if input_check_pressed("attack") && foi_falado==false{ 
	indice=string_length(texto[fala]);
	alarm[0]=5;
}

if indice=string_length(texto[fala]) alarm[0]=5;


if input_check_pressed("attack") && foi_falado==true {
	
	fala++;
	foi_falado=false;
	if fala>= array_length(texto){
	obj_player.dialogo_finalizado_cut1=true;
	instance_destroy();
	}
	
	}