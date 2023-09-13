var _cor= c_white;

if global.pos==1{
_cor= c_yellow;
}else{
	_cor= c_white;
}

draw_sprite_ext(spr_gm_over_menu, 1, x , y, 7, 7, 0, _cor, 1);

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


mouse_collision=point_in_rectangle(_mx,_my,x,y,x+sprite_width, y+sprite_height);

