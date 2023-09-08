image_xscale=4;
image_yscale=5;
collision_list= ds_list_create();
hitbox_list= ds_list_create();
var _c= instance_place_list(x,y,obj_player, collision_list, false);

if _c>0 {
	
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




