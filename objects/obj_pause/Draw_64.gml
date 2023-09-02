var _guih = display_get_gui_height();
var _guiw = display_get_gui_width();

if (global.paused) {
	

draw_set_alpha(.6);
draw_set_color(c_black);
draw_rectangle(0, 0, _guiw, _guih, 0);


draw_set_font(global.font_main);

//width
var _new_w= 0;

for (var i = 0; i< op_length; i++){

var _op_w = string_width(option[menu_level,i]);
_new_w = max(_new_w, _op_w);
}
width= _new_w + op_border*2;

//height
height = op_border *2 + string_height(option[0,0]) + (op_length-1)*op_space;

//drawing itself

var _novox= 1536/2 - width/2;
var _novoy= 1080/2- height/2;

draw_sprite_ext(spr_bg_pause, image_index, _novox, _novoy, width/32, height/32, 0, c_white, 1);

//ops

draw_set_halign(fa_left);
draw_set_valign (fa_top);

for (var i = 0; i< op_length; i++){

var _c = c_white; 
var posyi= _novoy +op_border+3;
var posy= i*op_space; 
var _recuo = 0;

if pos== i{
	
	_c= c_yellow
	draw_sprite_ext(spr_seta, image_index, _novox+op_border/2, posyi+ posy, 1, 1, 0, c_white, 1);
	_recuo =5;
	
	};

draw_text_color(_novox+op_border+_recuo, _novoy+op_border + op_space *i, option[menu_level, i], _c, _c, _c, _c, 1);



}


draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_alpha(1);
draw_set_color(-1);
}