function save_room() {


	// Acha quantos inimigos existem na room

	var _enemy_num= instance_number(obj_enemy);

	var _menu_num= instance_number(obj_menu);
	
	
	var _room_struct ={
		
	enemy_num : _enemy_num,
	enemy_data: array_create(_enemy_num), 

	
	}
	
	var _room_struct_menu ={
		

	menu_num: _menu_num,
	menu_data: array_create(_enemy_num),
	
	}
	
#region SALVA INIMIGO
	// Acha onde estão os inimigos
	
	for (var i=0; i<_enemy_num;i++){
	
	var _inst= instance_find(obj_enemy, i);
	
	_room_struct.enemy_data[i]= {
		
		x : _inst.x,
		y : _inst.y,
		life: _inst.life,
		x_scale:  _inst.x_scale,
		}
	
	}
	global.enemy=_room_struct.enemy_data;
#endregion

#region SALVA MENU

for (var i=0; i<_menu_num;i++){
	
	var _inst= instance_find(obj_menu, i);
	
	_room_struct_menu.menu_data[i]= {
		
	height_choice: _inst.height_choice,
	width_choice: _inst.width_choice,
	master_vol: global.master_vol,
		
		}
}
	
	global.menu=_room_struct_menu.menu_data;
	
#endregion	
	
	

	if room==rm_pre_historia or room==rm_futuro{
		
		global.level_data.level_1=_room_struct;
		
		
		};

	if room== rm_menu{
		
		global.level_data.level_menu=_room_struct_menu;
		
		};
	
}

function load_room(){

	var _room_struct=0;
	var _room_struct_menu=0;
	
	
	var _load_room=asset_get_index(global.stat_data.save_rm);
	
	
	// Pegar os dados de acordo com a Room que o player estiver
	
	if room== rm_pre_historia or room==rm_futuro{_room_struct = global.level_data.level_1};
	if room== rm_menu{_room_struct_menu = global.level_data.level_menu};
	
	
	// checar se room_struct é uma struct
	
	if is_struct(_room_struct)and !is_struct(_room_struct_menu){
	
	
	if instance_exists(obj_enemy){instance_destroy(obj_enemy); };
	layer_create(0,"enemy_load")
	
	
	for (var i=0; i<_room_struct.enemy_num; i++){
	
	with instance_create_layer(_room_struct.enemy_data[i].x,_room_struct.enemy_data[i].y,"enemy_load",obj_enemy){
		x_scale = _room_struct.enemy_data[i].x_scale;
		exclamacao_altura=5;
	
		life= _room_struct.enemy_data[i].life;
	
	
		}
	
	}

	}else if  !is_struct(_room_struct)and is_struct(_room_struct_menu){

for (var i=0; i<_room_struct_menu.menu_num; i++){
	

		with obj_menu{
		global.master_vol= _room_struct_menu.menu_data[i].master_vol;
		height_choice= _room_struct_menu.menu_data[i].height_choice;
		width_choice= _room_struct_menu.menu_data[i].width_choice;

			}	
}

	}else{
	exit;
	}
}
	
function save_game(_filenum){

var _save_array = array_create(0);

var _obj_player= instance_exists(obj_player);
var _obj_enemy= instance_exists(obj_enemy);
var _obj_menu= instance_exists(obj_menu);

	save_room();
	
	if _obj_player==true global.stat_data.save_x = obj_player.x;
	if _obj_player==true global.stat_data.save_y = obj_player.y;
	if _obj_player==true global.stat_data.diag1 = obj_player.dialogo_finalizado_cut1;
	if _obj_player==true global.stat_data.diag2 = obj_player.dialogo_finalizado_cut2;
	if _obj_player==true global.stat_data.diag4 = obj_player.dialogo_finalizado_cut4;
	if _obj_player==true global.stat_data.diag6 = obj_player.dialogo_finalizado_cut6;
	if _obj_player==true global.stat_data.xscale = obj_player.image_xscale;
	
	global.stat_data.save_rm = room_get_name(room);
	
	global.stat_data.enemy=global.level_data.level_1;

	
	array_push(_save_array, global.stat_data);
	
	array_push(_save_array, global.level_data);
	
	var _filename="savedata"+ string(_filenum) +".sav";
	var _json= json_stringify(_save_array);
	var _buffer = buffer_create(string_byte_length(_json)+1,buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	


}

function load_game(_filenum){

	var _filename="savedata"+ string(_filenum) +".sav";
	if !file_exists(_filename){exit;};
	
	var _buffer= buffer_load(_filename);
	var _json= buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_array = json_parse(_json);
	
	
	global.stat_data= array_get(_load_array, 0);
	global.level_data= array_get(_load_array, 1);
	
	global.level_data.level_1=global.stat_data.enemy;

	
	
	var _load_room= asset_get_index(global.stat_data.save_rm);
	room_goto(_load_room);
	
	obj_save_load.skip_room_saving=true;
	
	if instance_exists(obj_player){instance_destroy(obj_player);};

	with instance_create_layer(global.stat_data.save_x, global.stat_data.save_y, "Instances", obj_player){

	
	dialogo_finalizado_cut1=global.stat_data.diag1;
	dialogo_finalizado_cut2=global.stat_data.diag2;
	dialogo_finalizado_cut4=global.stat_data.diag4;
	dialogo_finalizado_cut6=global.stat_data.diag6;
	
	
	}
	
	
	
	
	load_room();
	

}

function save_menu(_filenum){

var _save_array = array_create(0);

var _obj_menu= instance_exists(obj_menu);

	save_room();


	global.menu_data.menu= global.level_data.level_menu;
	global.stat_data.save_rm = room_get_name(room);
		
	array_push(_save_array, global.menu_data);
	array_push(_save_array, global.level_data);
	
	var _filename="savemenu"+ string(_filenum) +".sav";
	var _json= json_stringify(_save_array);
	var _buffer = buffer_create(string_byte_length(_json)+1,buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	


}


function load_menu(_filenum){
	var _filename="savemenu"+ string(_filenum) +".sav";
	if !file_exists(_filename){exit;};
	
	var _buffer= buffer_load(_filename);
	var _json= buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_array = json_parse(_json);
	var _load_room= asset_get_index(global.stat_data.save_rm);
	
	global.menu_data= array_get(_load_array, 0);
	global.level_data= array_get(_load_array, 1);
	
	global.level_data.level_menu=global.menu_data.menu;
	
	
	obj_save_load.skip_room_saving=true;
	
	load_room();
	
	
	}
		
	


