pos_escolha += input_check_pressed("right") - input_check_pressed("left");
if pos_escolha >= 4 {pos_escolha = 0};
if pos_escolha < 0 {pos_escolha=3};

if input_check_pressed("accept"){
switch (pos_escolha){

case 0: global.escolheu_op_certa=false;global.escolheu=true; instance_destroy();break;
case 1: global.escolheu_op_certa=false;global.escolheu=true;	instance_destroy();break;
case 2: global.escolheu_op_certa=true;global.escolheu=true; instance_destroy();break;

case 3: global.escolheu_op_certa=false;global.escolheu=true;instance_destroy();break;

}

}
show_debug_message(pos_escolha)




