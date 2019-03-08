/// @description draw the gui for the title screen




var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = titleScreen_pages[page], ds_height = ds_grid_height(ds_grid); 
var y_buffer = 32 , x_buffer = 64 ; 
var start_y = gheight/2 + ((ds_height -1) * 36) + 110; 
var start_x = gwidth;
//var start_y = (gheight/2) - ((((ds_height - 1)/2) * y_buffer)), start_x = gwidth/2 ;

// draw the title screen option text
draw_set_valign(fa_bottom);
draw_set_halign(fa_right); 

var title_text_x_position = start_x - x_buffer, title_text_y_position, x_offset; 

var yy = 0; repeat(ds_height){
	title_text_y_position = start_y + (yy*y_buffer); 
	c = c_white;
	x_offset = 0;
	
	if(yy == titleScreen_option[page]){
		c = c_red;
		x_offset = -(x_buffer/2);
	}
	
	draw_text_color(title_text_x_position + x_offset, title_text_y_position, ds_grid[# 0, yy],c,c,c,c,1); 
	yy++;
}



draw_set_valign(fa_top); 
draw_set_halign(fa_left);
	