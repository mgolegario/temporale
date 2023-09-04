op_length = array_length(option[menu_level]);


pos += input_check_pressed("down") - input_check_pressed("up");
if pos>= op_length {pos = 0};
if pos < 0 {pos= op_length-1};



// CONTROLA O SOM PELO MENU

valor_ = round(global.master_vol *100);

if valor_ = -0 {

valor_= valor_*-1;
}



if menu_level=5 {

		if input_check("left"){

			if global.master_vol!= 1{

				global.master_vol= lerp(global.master_vol, global.master_vol + 0.01, 0.4);
	
				
			} 
		}

		if  input_check("right"){

			if global.master_vol!= 0{

				global.master_vol= lerp(global.master_vol, global.master_vol - 0.01, 0.4);

			} 

		}
		
	};

// 




if (input_check_pressed("accept")){
	

var _sml= menu_level;

switch (menu_level) {
	
	case 0:
		switch (pos){

			case 0: room_goto(rm_pre_historia); break;
	
			case 1:  break;
	
			case 2: menu_level=1; break;
			
			case 3: game_end(); break;

			} 

	break;
	
	case 1:
	switch (pos){

			case 0: menu_level=2; break;
	
			case 1: menu_level=4;break;
	
			case 2: menu_level=6; break;
			
			case 3:	
			
			if (width_choice=0 and height_choice =0){
				menu_level= 0;
				
				}else{
				ajusta(); 
				window_set_position(dwidth/2-width_choice/2, dheight/2-height_choice/2); 
				menu_level= 0;	
				
			}
			
			break;

			} 
			break;
	case 2:
	switch (pos){
		
			case 0: width_choice=1; height_choice= 1;break;
	
			case 1:  width_choice=1920; height_choice= 1080;break;
	
			case 2:  menu_level=3;break;
	
			case 3: 
			
			if (width_choice=0 and height_choice =0) {
				menu_level= 1;
			
			}else{
				ajusta();
				window_set_position(dwidth/2-width_choice/2, dheight/2-height_choice/2); 
				menu_level= 1;
				
			}
			break;
		
			}
			break;
	case 3:
	switch (pos){
		
			case 0:  width_choice=1280; height_choice= 720;break;
		
			case 1:  width_choice=720; height_choice= 480;break;
			
			case 2: width_choice=640; height_choice= 480;break;
			
			case 3: 
				if (width_choice=0 and height_choice =0){
				menu_level= 2;
				
				}else{
				ajusta(); 
				window_set_position(dwidth/2-width_choice/2, dheight/2-height_choice/2); 
				menu_level= 2;	
				
			}
			
			break;
		
			}
			
			break;
			
	case 4:
	switch (pos){
		
			case 0: menu_level=5 ;break;
		case 1: menu_level=1; break;
		
			}
			break;
	
	case 5:
	switch (pos){
		
			case 0: break;
	
			case 1: menu_level=1;break;
		
			}
			
			break;
			
	case 6:
	switch (pos){
		
			case 0: menu_level=7; break;
			case 1: menu_level=9;break;
			case 2: menu_level=1; break;
		
			}
			
			break;
	
	case 7:
	switch (pos){
		
			case 0: break;
			case 1: break;
			case 2: break;
			case 3: menu_level=8; break;
		
			}
			
			break;
			
	case 8:
	switch (pos){
		
			case 0: break;
			case 1: menu_level=6;break;
		
		
			}
			
			break;
			
	case 9:
	switch (pos){
		
			case 0: break;
			case 1: menu_level=6;break;
		
		
			}
			
			break;
			
}


	if _sml !=menu_level {pos=0};
	op_length = array_length(option[menu_level]);
}



option[5,0] = string(valor_) + "%";