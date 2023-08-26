draw_surface(sombra_surface, 0, 0);

if surface_exists(sombra_surface){
	surface_set_target(sombra_surface);
	
	draw_set_alpha(.8);
	draw_set_color(c_black);

	
	draw_rectangle(0,0,room_width, room_height, false);
	
	draw_set_color(c_white);

	
	gpu_set_blendmode(bm_subtract);
	
	if instance_exists(obj_tocha) {
		var _num= instance_number(obj_tocha);
		
		for (var i=0; i< _num; i++) {
			var _inst = instance_find(obj_tocha, i);
	
			draw_set_alpha(.9);
			draw_circle(_inst.x, _inst.y, lerp( 104 ,104 + irandom(5), 0.3), false);
	
			draw_set_alpha(0.5);
			draw_circle(_inst.x, _inst.y, lerp( 127 ,127 + irandom(5), 0.3) , false);
	
		}
	}
	
	draw_set_alpha(.9);
	draw_circle(obj_player.x, obj_player.y - 35, lerp( 104 ,104 + irandom(5), 0.3), false);
	
	draw_set_alpha(0.5);
	draw_circle(obj_player.x, obj_player.y - 35, lerp( 127 ,127 + irandom(5), 0.3) , false);	
	
	draw_set_alpha(1);
	
	
	gpu_set_blendmode(bm_normal);

	surface_reset_target();
	
}else {

	sombra_surface = surface_create(room_width, room_height);

}






