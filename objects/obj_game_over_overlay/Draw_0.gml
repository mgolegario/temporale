if instance_exists(obj_player){
if obj_player.tempo_morto<=0{
	
	layer_create(-100,"transicao");

	layer_depth("transicao", -100);

	draw_set_color(c_black);
	draw_set_alpha(opacidade);	
	draw_rectangle(0,0,room_width,room_height,false)
	
	if opacidade<=1{
	opacidade+=0.01;
	
	}else{
	room_goto(rm_game_over);
	}
}
}
	draw_set_color(-1);
	draw_set_alpha(1);
    	





