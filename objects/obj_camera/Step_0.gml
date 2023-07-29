#region CAMERA ESTILO JUMP KING


var _gridy= 1080;


var _meuy;


_meuy= (obj_player.y div _gridy)* _gridy;




x= lerp(x, obj_player.x, 0.04);
y= lerp(y, _meuy, 0.09);


camera_set_view_pos(view_camera[0], x, y);


#endregion




