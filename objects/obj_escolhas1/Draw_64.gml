var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _mouse_usado=false;


draw_set_font(fnt_dialogo);




for (var i=0; i<array_length(options); i++){

var _c= c_white;
	
	if pos_escolha== i{
	    
		_c= c_yellow
		
	}



draw_text_color(x+(400*i), y, options[i], _c, _c, _c, _c, 1);



}






