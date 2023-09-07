repeat(abs(hspd)){

if (place_meeting(x+sign(hspd), y, obj_wall)){
	
	if (!place_meeting(x+sign(hspd), y-2, obj_wall)) {

	y-=2;

	}
	
}else{
			
	if (!place_meeting(x+sign(hspd), y+2, obj_wall) ) { 

		if(place_meeting(x+sign(hspd), y+4, obj_wall)){
		y+=2;
		
		sprite_index=spr_enemy1_idle;


		}
	}
}


if (place_meeting(x+sign(hspd), y, obj_wall) or colisao_inimigo==true){

hspd= 0;

break;

}else{

x+= sign(hspd);
}

}

repeat(abs(vspd)){

if (place_meeting(x, y+sign(vspd), obj_wall)){


vspd= 0;
break;

}else{

y+= sign(vspd);
}


}