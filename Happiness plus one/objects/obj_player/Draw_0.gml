/// @description Insert description here
// You can write your code in this editor

	x1 = camera_get_view_x(view_xport[0]);
	x2 = camera_get_view_width(view_xport[0]);	
	y1 = camera_get_view_y(view_yport[0]);
	y2 = camera_get_view_height(view_yport[0]);
	
	draw_self(); 
	for( var i = 0; i < ds_list_size(inventory); i++)
	{
		draw_text(x,y+(24*i),inventory[|i]); 
	}