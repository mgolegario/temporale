draw_set_font(fnt_dialogo);

var _posicaox= 39;
var _posicaoy= 655;


var _texto= string_copy(texto[fala],0,indice);


draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite_ext(caixa[0,troca_balao], 0, _posicaox, _posicaoy, 1, 1, 0, c_white, 1);


draw_text_ext( _posicaox+35, _posicaoy+120 + string_height(texto[fala]), _texto, 25+string_height(texto[fala])/2, 1012);


if foi_falado {

draw_sprite_ext(spr_seta_dialogo,0, 1415,335+_posicaoy,1,1,0,c_white,1)


}
	

draw_set_font(-1);
draw_set_color(-1);
draw_set_valign(-1);
draw_set_halign(-1);





