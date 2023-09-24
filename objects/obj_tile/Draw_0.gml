if(value mod 2 ==0) image_blend=c_white else image_blend=c_red;

draw_self();
draw_set_color(c_blue)
draw_rectangle(x,y, x+sprite_width, y+sprite_height, true)

draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_color(c_black)


draw_text(x +(sprite_width*0.5),y+(sprite_height*0.5),value);



draw_set_valign(-1)
draw_set_halign(-1)
draw_set_color(-1)