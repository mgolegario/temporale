if (indice <= string_length(texto)){
	
	if indice==ceil(indice){
		var _char = string_char_at(texto, indice);
		if _char!=" "{
			obj_SFX.text_snd=true;
		}
	}
	
	indice+=vel_txt;
	
	if (indice+vel_txt>= ceil(indice)){
	indice = ceil(indice);
	
	}

}


if input_check_pressed("attack") indice=string_length(texto);