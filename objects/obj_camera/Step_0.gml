#region CAMERA ESTILO JUMP KING

var _cutscene=false;
if instance_exists(obj_player){
if obj_player.state=player_state_cutscene1{
	
	x=obj_player.x;
	y=obj_player.y;
	
camera_set_view_size(view_camera[0], 768, 540);
camera_set_view_pos(view_camera[0], x, y+400);
_cutscene=true;

}else{

camera_set_view_size(view_camera[0], 1536, 1080);

var _gridy= 1080;


var _meuy;


_meuy= (obj_player.y div _gridy)* _gridy;


	if _cutscene{
		
		
		y= lerp(y, _meuy, 0.05);
		x= lerp(x, obj_player.x, 0.04);
		camera_set_view_pos(view_camera[0], x, y);
		
		_cutscene=false;
	}
	




x= lerp(x, obj_player.x, 0.04);
y= lerp(y, _meuy, 0.09);


camera_set_view_pos(view_camera[0], x, y);

}


}

#endregion




