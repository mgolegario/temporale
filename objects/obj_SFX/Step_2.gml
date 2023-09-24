// Volume

var _sfx_vol = global.sfx_vol * global.master_vol;






//som pulo

if jump_snd == true {

	var _snd = audio_play_sound(snd_jump, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	jump_snd = false;

}

if bonk_snd == true {

	var _snd = audio_play_sound(snd_bonk, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	bonk_snd = false;

}

if ataque_snd == true {

	var _snd = audio_play_sound(ataque1, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	ataque_snd = false;

}

//som andar

if grass_snd == true && !audio_is_playing(grass_snd_inst){
	
	grass_snd_inst= audio_play_sound( snd_grama, 4, true);
	
	
}

if audio_is_playing(grass_snd_inst){

	audio_sound_gain( grass_snd_inst, _sfx_vol ,0);
	
}



if grass_snd == false && audio_is_playing(grass_snd_inst){


	audio_stop_sound(grass_snd_inst);

}

grass_snd= false;

if metal_snd == true && !audio_is_playing(metal_snd_inst){
	
	metal_snd_inst= audio_play_sound( snd_metal, 4, true);
	
	
}

if audio_is_playing(metal_snd_inst){

	audio_sound_gain( metal_snd_inst, _sfx_vol ,0);
	
}



if metal_snd == false && audio_is_playing(metal_snd_inst){


	audio_stop_sound(metal_snd_inst);

}

metal_snd= false;

//som texto

if text_snd == true {


	var _snd = audio_play_sound(snd_text, 8, false, , , global.pitch);
	audio_sound_gain( _snd, _sfx_vol-0.5 ,0)
	text_snd = false;

}

if ataque_snd2 == true {

	var _snd = audio_play_sound(ataque2, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	ataque_snd2 = false;

}

if ataque_snd3 == true {

	var _snd = audio_play_sound(ataque3, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	ataque_snd3 = false;

}





if menu_snd == true && !audio_is_playing(menu_snd_inst){
	
	menu_snd_inst= audio_play_sound( snd_menu, 4, true);
	
	
}

if audio_is_playing(menu_snd_inst){

	audio_sound_gain( menu_snd_inst, _sfx_vol ,0);
	
}



if menu_snd == false && audio_is_playing(menu_snd_inst){


	audio_stop_sound(menu_snd_inst);

}

menu_snd= false;


if play_snd == true {

	var _snd = audio_play_sound(snd_start_game, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	play_snd = false;

}




if fase1_snd == true && !audio_is_playing(fase1_snd_inst){
	
	fase1_snd_inst= audio_play_sound( snd_primeira_fase, 4, true);
	
	
}

if audio_is_playing(fase1_snd_inst){

	audio_sound_gain( fase1_snd_inst, _sfx_vol ,0);
	
}



if fase1_snd == false && audio_is_playing(fase1_snd_inst){


	audio_stop_sound(fase1_snd_inst);

}

fase1_snd= false;



if fase2_snd == true && !audio_is_playing(fase2_snd_inst){
	
	fase2_snd_inst= audio_play_sound( snd_segunda_fase, 4, true);
	
	
}

if audio_is_playing(fase2_snd_inst){

	audio_sound_gain( fase2_snd_inst, _sfx_vol ,0);
	
}



if fase2_snd == false && audio_is_playing(fase2_snd_inst){


	audio_stop_sound(fase2_snd_inst);

}

fase2_snd= false;

if room==rm_futuro or room==rm_puzzle {fase2_snd=true};
if room==rm_pre_historia {fase1_snd=true};