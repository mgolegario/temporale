var _key_esc = keyboard_check_pressed(vk_escape);

if (_key_esc) {

global.pause = !global.pause

}


var key_up = keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(vk_down);
var key_accept = keyboard_check_pressed(vk_enter);


op_length = array_length(option[menu_level]);




pos += key_down - key_up;
if pos>= op_length {pos = 0};
if pos < 0 {pos= op_length-1};



if (key_accept){
	

var _sml= menu_level;

switch (menu_level) {
	
	case 0:
		switch (pos){

			case 0: global.paused=false;global.pause=false; break;
	
			case 1: break;
	
			case 2:  menu_level=1; break;
			
			case 3: room_goto(rm_menu); break;
			
			case 4: game_end(); break;

			} 
	break;
	
	case 1:
	switch (pos){

			case 0: break;
	
			case 1: break;
	
			case 2: break;
			
			case 3: menu_level= 0;

			} 
	
	
	}
	
	if _sml !=menu_level {pos=0};
	op_length = array_length(option[menu_level]);
}
