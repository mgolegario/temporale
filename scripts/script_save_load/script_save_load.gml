function save_room() {


	// Acha quantos inimigos existem na room

	var _enemy_num= instance_number(obj_enemy);

	var _menu_num= instance_number(obj_menu);
	
	
	var _room_struct ={
		
	enemy_num : _enemy_num,
	enemy_data: array_create(_enemy_num), 
	
	menu_data: array_create(_menu_num),
	
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
	
#endregion

for (var i=0; i<_menu_num;i++){
	
	var _inst= instance_find(obj_enemy, i);
	
	_room_struct.menu_data[i]= {
		
	height_choice= .menu_heigh_choice;
	width_choice=_room_struct.menu_width_choice;
	global.master_vol=_room_struct.menu_master_volume;
		
		}
	
	}

	if room==rm_pre_historia{
		
		global.level_data.level_1=_room_struct

		
		};



	
}

function load_room(){

	var _room_struct=0;
	
	// Pegar os dados de acordo com a Room que o player estiver
	if room== rm_pre_historia{_room_struct = global.level_data.level_1};
	
	// checar se room_struct é uma struct
	
	if !is_struct(_room_struct){exit;};
	
	if instance_exists(obj_enemy){instance_destroy(obj_enemy); };
	layer_create(0,"enemy_load")
	for (var i=0; i<_room_struct.enemy_num; i++){
	
	with instance_create_layer(_room_struct.enemy_data[i].x,_room_struct.enemy_data[i].y,"enemy_load",obj_enemy){
		x_scale = _room_struct.enemy_data[i].x_scale;
		exclamacao_altura=5;
	
		life= _room_struct.enemy_data[i].life;
	
	}
	
	}
	
	with obj_menu{
		
	height_choice= _room_struct.menu_heigh_choice;
	width_choice=_room_struct.menu_width_choice;
	global.master_vol=_room_struct.menu_master_volume;
	
	}
	
	
	
	
	}
	
	

