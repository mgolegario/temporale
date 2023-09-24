var value=1;

for (var j=0; j<4; j++){
	
	for (var i=0; i<4; i++){
	if value!=16{
			var _ins = instance_create_layer(x+(i*sprite_get_width(spr_tile)),y+(j*sprite_get_height(spr_tile)),"Instances", obj_tile)

		_ins.value=value;
		value++
	
	}
	
	}

}


