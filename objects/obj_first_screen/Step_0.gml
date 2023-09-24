if keyboard_check(vk_space) or input_check_pressed("diagPass"){
room_goto(rm_menu)

}

if contagem<50 {
contagem++
teste=1
}else {

teste=0;
contagem++
if contagem =100 contagem=0;
}
