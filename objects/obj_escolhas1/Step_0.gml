pos_escolha += input_check_pressed("right") - input_check_pressed("left");
if pos_escolha >= 4 {pos_escolha = 0};
if pos_escolha < 0 {pos_escolha=3};

if input_check_pressed("accept"){
switch (pos_escolha){

case 0: obj_player.state=player_state_dead;break;
case 1: obj_player.state=player_state_dead;break;
case 2: obj_player.state=player_state_free;break;
case 3: obj_player.state=player_state_dead;break;


}

}
show_debug_message(pos_escolha)




