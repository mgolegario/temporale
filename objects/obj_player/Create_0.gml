#region DECLARACÕES VARIÁVEIS
hspd = 0;
vspd = 0;
vspd_min = -14;
vspd_max = 35;
grv = 0.5;

oi=0;
move_dir = 0;
move_spd = 0;
move_spd_max= 7.0;
acc = 0.45;
dcc = 0.45;


jump_height = 14;
coyote_time_max = 12;
coyote_time = 0;

state = player_state_free;

x_scale = 4;
y_scale = 4;

move = 0;
ground = false;



global.pulou = 0;
global.caiu = 0;
global.caiu_alto = false;



state= player_state_free();
#endregion




/*#region CAMERA ESTILO JUMP KING
move_camera= function () {

static _gridy= 1080;
static _gridx= 1536

var _meuy;
var _meux;


_meux= (x div _gridx)* _gridx;
_meuy= (y div _gridy)* _gridy;

var _camera = camera_get_view_x(view_camera[0]);

if _camera <= 0 {
_camera = 0;
}


var _camx = lerp(_camera, x - 1536/2, .06)
var _camy = lerp(camera_get_view_y(view_camera[0]), _meuy, .09)

show_debug_message(camera_get_view_x(view_camera[0]))


}

#endregion