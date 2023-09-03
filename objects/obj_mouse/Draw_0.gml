if input_check("click"){
	
	draw_sprite_ext(spr_mouse_click, 0, mouse_x, mouse_y, 2, 2, 0, c_white, 1);
}else{
	
	draw_sprite_ext(spr_mouse, 0, mouse_x, mouse_y, 2, 2, 0, c_white, 1);
}