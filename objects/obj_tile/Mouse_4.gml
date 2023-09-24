if (place_empty(x+1,y))==true{
x+=sprite_width;

}else if(place_empty(x-1,y))==true{
	
x-=sprite_width;
}else if (place_empty(x,y+1))==true{
y+=sprite_height;

}else if(place_empty(x,y-1))==true{
	
y-=sprite_height;
}