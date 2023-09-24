image_xscale=5;
image_yscale=4;
collision_list= ds_list_create();
hitbox_list= ds_list_create();
var _c= instance_place_list(x,y,obj_enemy, collision_list, false);
var _c2= instance_place_list(x,y,obj_dino, collision_list, false);
var _c3= instance_place_list(x,y,obj_boss_futuro, collision_list, false);
if _c>0 or _c2>0 or _c3>0 {
	
	for (var i=0; i < ds_list_size(collision_list); i++){
		
		var _target= collision_list[|i];
		
		if !ds_list_find_index(hitbox_list, _target){
			
			ds_list_add(hitbox_list, _target);
			
			with(_target){
				
				life-=1;
			
			}
		}
	}
}




