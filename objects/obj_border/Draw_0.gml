var winningCondition = [ 1, 5, 9 ,  13,
						 2, 6, 10,  14,
						 3, 7, 11,  15,
						 4, 8, 12, noone];
						
var value=0;
var complete= true;

for (var j=0; j<4; j++){
	
	for (var i=0; i<4; i++){
		
			var _ins = collision_point(x+(i*sprite_get_width(spr_tile)),y+(j*sprite_get_height(spr_tile)), obj_tile,false,false)
				
				var tile_value= noone;
				
				if _ins != noone {
				
				tile_value= _ins.value
				
				}
				
				if tile_value != winningCondition[value]{
				
				complete=false;
				
				}
			value++;	
	}
}
	
	draw_self();
	
	if (complete==true){
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(x, y-30, "COMPLETED!")
	
	}

