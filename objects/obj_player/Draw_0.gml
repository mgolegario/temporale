draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1);

if !global.dialogo_ja_feito{
if opacidade>0{
	
	layer_create(-100,"transicao");

	layer_depth("transicao", -100);

	draw_set_color(c_white);
	draw_set_alpha(opacidade);	
	draw_rectangle(0,0,room_width,room_height,false)
	

	opacidade-=0.01;
	

	}
}


if tempo_troca_sala<=0{

	layer_create(-100,"transicao");

	layer_depth("transicao", -100);

	draw_set_color(c_white);
	draw_set_alpha(opacidade);	
	draw_rectangle(0,0,room_width,room_height,false)
	

	opacidade+=0.01;

}
if room==rm_futuro{
	
	layer_create(-100,"transicao");

	layer_depth("transicao", -100);

	draw_set_color(c_white);
	draw_set_alpha(opacidade);	
	draw_rectangle(0,0,room_width,room_height,false)
	

	opacidade-=0.01;

}


	draw_set_color(-1);
	draw_set_alpha(1);
	
