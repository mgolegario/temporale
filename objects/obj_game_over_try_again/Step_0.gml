if instance_exists(obj_player){instance_destroy(obj_player)};

if mouse_collision==true{
global.pos=0;
}

if mouse_collision && input_check("attack"){

if global.can_save==false {load_game(1);}
if global.can_save==true {load_game(2);}
if global.can_save1==true{load_game(3);}

}

if input_check("accept")&& global.pos==0{
if global.can_save==false {load_game(1);}
if global.can_save==true {load_game(2);}
if global.can_save1==true{load_game(3);}

}

