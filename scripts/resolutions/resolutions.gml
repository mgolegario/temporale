function ajusta(){
	if (width_choice=1 && height_choice=1) {
	
			window_set_fullscreen(true);

	}else{
		window_set_fullscreen(false);
		window_set_size(width_choice, height_choice); 
		window_set_position(dwidth/2-width_choice/2, dheight/2-height_choice/2); 
		
	}			
}
