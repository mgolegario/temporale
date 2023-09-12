

mouse_collision=point_in_rectangle(_mx,_my,x,y,x+sprite_width, y+sprite_height);

draw_sprite_ext(spr_game_over, 1, x , y, 1, 1, 0, c_white, 1);


draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


draw_text(x,y, texto_morte);

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
