draw_set_font(fnt_dialogo);

var _texto= string_copy(texto,0,indice);


draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite_ext(spr_caixa_player_1, 0, 39, 655, 1, 1, 0, c_white, 1);


draw_text_ext( 39+35, 655+120 + string_height(texto), _texto, 25+string_height(texto)/2, 1012);



draw_set_font(-1);
draw_set_color(-1);
draw_set_valign(-1);
draw_set_halign(-1);
