if global.pode_salvar==true{
if global.can_save1==false && global.can_save==false{save_game(1);}
if global.can_save==true {save_game(2);}
if global.can_save1==true && global.can_save==false{save_game(3);}
	global.pode_salvar=false;
}


obj_player.tempo_troca_sala=2;