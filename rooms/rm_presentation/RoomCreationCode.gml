width_choice=1536;
height_choice=1080;
dwidth=display_get_width();
dheight= display_get_height();

	
if file_exists("savemenu1.sav"){
	load_menu(1);
	height_choice= global.level_data.level_menu.menu_data[0].height_choice;
	width_choice=global.level_data.level_menu.menu_data[0].width_choice;
	
}
	
ajusta(); 