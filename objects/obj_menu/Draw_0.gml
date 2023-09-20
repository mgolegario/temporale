draw_set_font(global.font_main);

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


var _new_w= 0;

for (var i = 0; i< op_length; i++){
	
var _op_h = string_height(option[menu_level,i]);
var _op_w = string_width(option[menu_level,i]);
_new_w = max(_new_w, _op_w);
}


width= _new_w + op_border*2;
height = op_border *2 + string_height(option[0,0]) + (op_length-1)*op_space;


draw_sprite_ext(sprite_index, image_index, x, y, width/32, height/32, 0, c_white, 1);

//ops

draw_set_halign(fa_left);
draw_set_valign (fa_top);

for (var i = 0; i< op_length; i++){

var _c = c_white; 
var posyi= y +op_border+3;
var posy= i*op_space; 
var _recuo = 0;
var _op_h = string_height(option[menu_level,i]);
var _op_w = string_width(option[menu_level,i]);
var _mouse_colision=point_in_rectangle(_mx,_my, x + op_border, y + op_border+op_space*i, x + op_border + _op_w, y + op_border+ op_space*i + _op_h);


	if _mouse_colision{
	
		_c = c_yellow;
		draw_sprite_ext(spr_seta, image_index, x+op_border/2, posyi+ posy, 1, 1, 0, c_white, 1);
		_recuo =5;
		

		mouse_usado=true;
		pos= i;
		
	
		
	}
	
	if input_check("up") or input_check("down"){ 
		mouse_usado= false;
		
	};
			
	if pos== i && !mouse_usado{
	    
		_c= c_yellow
		draw_sprite_ext(spr_seta, image_index, x+op_border/2, posyi+ posy, 1, 1, 0, c_white, 1);
		_recuo =5;

	
		
	}
	

	
draw_text_color(x+op_border+_recuo, y+op_border + op_space *i, option[menu_level, i], _c, _c, _c, _c, 1);



}



draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);