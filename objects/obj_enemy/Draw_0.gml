draw_sprite_ext(sprite_index, image_index, x, y, x_scale, y_scale, 0, c_white, 1);

draw_set_halign(fa_center);
draw_set_font(fnt_vida);
draw_text(x, y-sprite_height/2,"Vida:"+string(life));

if estado=estado_prepara_ataque && sat<1 {
	
	draw_sprite_ext(spr_exclamacao,0, x,y-sprite_height-20*exclamacao_altura,1,1,0,make_color_rgb(125, 17, 19),sat*4)

}

draw_set_halign(-1);
draw_set_font(-1);