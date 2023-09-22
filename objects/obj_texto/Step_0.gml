if texto_por_fala!= texto[fala]{
indice=1;
texto_por_fala=texto[fala];
//if troca_balao=0 troca_balao=1 else troca_balao=0;
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

if troca_balao=2 or  troca_balao=3 {
global.pitch=0.98;
}else{
global.pitch=1;
}
 
if input_check_pressed("attack") && foi_falado==false{ 
	indice=string_length(texto[fala]);
	alarm[0]=5;
}

if indice=string_length(texto[fala]) alarm[0]=5;


if obj_player.comecou_diag1{
	
if fala=0 {troca_balao=0;};
if fala=1 {troca_balao=2;};
if fala=2 {troca_balao=1;};
if fala=3 {troca_balao=3;};
if fala=4 {troca_balao=0;};
if fala=5 {troca_balao=2;};
if fala=6 {troca_balao=3;};
if fala=7 {troca_balao=0;};
if fala=8 {troca_balao=3;};
if fala=9 {troca_balao=1;};
if fala=10 {troca_balao=2;};
if fala=11 {troca_balao=1;};
if fala=12 {troca_balao=2;};
if fala=13 {troca_balao=0;};
if fala=14 {troca_balao=3;};
if fala=15 {troca_balao=2;};
if fala=16 {troca_balao=0;};

}

if obj_player.comecou_diag2{
	
if fala=0 {troca_balao=1;};
if fala=1 {troca_balao=4;};
if fala=2 {troca_balao=0;};
if fala=3 {troca_balao=5;};
if fala=4 {troca_balao=1;};
if fala=5 {troca_balao=5;};
if fala=6 {troca_balao=0;};
if fala=7 {troca_balao=4;};
if fala=8 {troca_balao=1;};
if fala=9 {troca_balao=5;};
if fala=10 {troca_balao=1;};
if fala=11 {troca_balao=5;};

}

if global.escolheu=false && global.controle_cut2{
if fala=0{troca_balao=5;};
}

if input_check_pressed("attack") && foi_falado==true {
	
	fala++;
	foi_falado=false;
	if fala>= array_length(texto){
	if obj_player.state=player_state_cutscene1{obj_player.dialogo_finalizado_cut1=true;}
	if obj_player.state=player_state_cutscene2 && !obj_player.dialogo_finalizado_cut2{obj_player.dialogo_finalizado_cut2=true; obj_player.pode_criar=true;}
	if global.escolheu{obj_player.diag_escolha=true}
	instance_destroy();
	}
	
	}

