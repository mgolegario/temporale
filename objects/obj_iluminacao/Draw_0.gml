
if surface_exists(sombra_surface){
	surface_set_target(sombra_surface);
	
	
	draw_set_color(c_black);
	draw_set_alpha(.8);
	
	draw_rectangle(0,0,room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);

	
	gpu_set_blendmode(bm_subtract);
	draw_circle(mouse_x, mouse_y, 24, false);
	
	gpu_set_blendmode(bm_normal);

	surface_reset_target();
	
}else {

sombra_surface = surface_create(room_width, room_height);

}






