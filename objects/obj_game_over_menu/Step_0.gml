global.pos += input_check_pressed("down") - input_check_pressed("up");
if global.pos>= 2 {global.pos = 0};
if global.pos < 0 {global.pos= 1-1};

if mouse_collision && input_check("attack"){
room_goto(rm_menu);

}

if input_check("accept")&& global.pos==1{
room_goto(rm_menu);

}

show_debug_message(global.pos)
