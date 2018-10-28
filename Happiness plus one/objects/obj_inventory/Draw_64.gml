/// @description draw the inventory
/// draw menu


if(showInventory)
{
	var x1,x2,y1,y2;
	x1 = camera_get_view_x(view_xport[0]);
	//x2 = x1 + camera_get_view_x(view_camera[0]);
	
	x2 = camera_get_view_width(view_xport[0]);
	//x1 = display_get_gui_width() * 0.5;
	
	y1 = camera_get_view_y(view_yport[0]);
	//y2 = y1 + 64; 
	
	y2 = camera_get_view_height(view_yport[0]);
	//y1 = display_get_gui_height() * 0.5;

	draw_set_color(c_black);
	//draw_set_halign()
	//draw_set_valign()
	draw_set_alpha(1);
	draw_rectangle(x1+buffer,y1+buffer,x2-buffer,y2-buffer,false);
	draw_set_alpha(1); 
}










/*
draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom); 

for(var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert(">", txt, 0);
		var col = c_white; 
	}
	else
	{
		var col = c_gray	
	}
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * ( i * 1.5));
	draw_set_color(c_black);
	draw_text(xx - offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx, yy-offset, txt);
	draw_set_color(col)
	draw_text(xx, yy, txt); 
	
}

*/