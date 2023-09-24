#region CAMERA ESTILO JUMP KING
var _camera_perto=false;

if obj_player.state=player_state_cutscene1 or obj_player.state=player_state_cutscene2 or obj_player.state=player_state_cutscene3 or obj_player.state=player_state_dead or obj_player.state=player_state_cutscene4 or obj_player.state=player_state_cutscene5{
_camera_perto=true;
}else{
_camera_perto=false;
}

var _cutscene=false;
if instance_exists(obj_player){
if _camera_perto{
	
	x=obj_player.x;
	y=obj_player.y-340;
	
camera_set_view_size(view_camera[0], 768, 540);
camera_set_view_pos(view_camera[0], x, y);
_cutscene=true;

}else{



camera_set_view_size(view_camera[0], 1536, 1080);

var _gridy= 1080;


var _meuy;


_meuy= (obj_player.y div _gridy)* _gridy;


	
x= lerp(x, obj_player.x, 0.04);
y= lerp(y, _meuy, 0.09);

camera_set_view_pos(view_camera[0], x, y);

}


}

#endregion





