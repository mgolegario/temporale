width = 0;
height = 0;
global.pode_salvar=false;
global.can_save=false;
global.can_save1=false;
opcao_selected=false;
mouse_usado= false;

dwidth=display_get_width();
dheight= display_get_height();
width_choice= 0; 
height_choice= 0;

valor_= 100;


op_border = 60;
op_space = 100;

pos= 0;

option[0,0] = "Play";
option[0,1] = "Settings";
option[0,2] = "Quit";

option[1,0] = "Window Size";
option[1,1] = "Sound";
option[1,2] = "Controls";
option[1,3] = "Back";

option[2,0] = "Fullscreen";
option[2,1] = "1920x1080";
option[2,2] = "More...";
option[2,3] = "Back & Apply";

option[3,0] = "1280x720";
option[3,1] = "720x480";
option[3,2] = "640x480";
option[3,3] = "Back & Apply";

option[4,0] = "Master Volume" ;
option[4,1] = "Back";

option[5,0] = string(valor_) + "%";
option[5,1] = "Back";

option[6,0] = "Keyboard and Mouse";
option[6,1] = "Controller";
option[6,2] = "Back";


option[7,0] = "Right:   D or ->";
option[7,1] = "Left:    A or <-";
option[7,2] = "Jump:    Spacebar";
option[7,3] = "More...";


option[8,0] = "Attack:  LMB";
option[8,1] = "Dialogue: F";
option[8,2] = "Back";

option[9,0] = "Move: Analogic or Pad";
option[9,1] = "Attack: X";
option[9,2] = "Jump: A";
option[9,3] = "More...";


option[10,0] = "Saved Game 1";
option[10,1] = "Saved Game 2";
option[10,2] = "Saved Game 3";
option[10,3] = "Back";

option[11,0] = "Dialogue: Y";
option[11,1] = "Back";


op_length = 0;
menu_level = 0;