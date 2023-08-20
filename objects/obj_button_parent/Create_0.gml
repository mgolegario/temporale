width = 0;
height = 0;

dwidth=display_get_width();
dheight= display_get_height();
width_choice= 0; 
height_choice= 0;

valor_= 100;


op_border = 60;
op_space = 100;

pos= 0;

option[0,0] = "New Game";
option[0,1] = "Continue";
option[0,2] = "Settings";
option[0,3] = "Quit";

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



op_length = 0;
menu_level = 0;