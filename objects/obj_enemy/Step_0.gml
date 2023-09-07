estado();

vspd+=grv;
vspd = clamp(vspd, vspd_min, vspd_max);


if !estou_perseguindo or !estou_atacando{

	colisao_inimigo=  place_meeting(x+sign(move),y, obj_wall_enemy);
	
	

}else {
		
		colisao_inimigo= false;

		
}
