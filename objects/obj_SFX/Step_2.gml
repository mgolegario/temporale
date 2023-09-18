// Volume

var _sfx_vol = global.sfx_vol * global.master_vol;






//som pulo

if jump_snd == true {

	var _snd = audio_play_sound(snd_jump, 8, false);
	audio_sound_gain( _snd, _sfx_vol ,0)
	jump_snd = false;

}



//som andar

if walk_sound_loop == true && !audio_is_playing(walk_sound_loop_inst){
	
	walk_sound_loop_inst= audio_play_sound( snd_walk, 4, true);
	
	
}

if audio_is_playing(walk_sound_loop_inst){

	audio_sound_gain( walk_sound_loop_inst, _sfx_vol ,0);
	
}



if walk_sound_loop == false && audio_is_playing(walk_sound_loop_inst){


	audio_stop_sound(walk_sound_loop_inst);

}

walk_sound_loop= false;

//som texto

if text_snd == true {


	var _snd = audio_play_sound(snd_text, 8, false, , , global.pitch);
	audio_sound_gain( _snd, _sfx_vol-0.5 ,0)
	text_snd = false;

}


