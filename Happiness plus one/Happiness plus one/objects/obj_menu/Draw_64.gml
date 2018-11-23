/// @description draw the gui for the menu 
	if(!global.pause) exit; 

	var gwidth = global.view_width, gheight = global.view_height;

	var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid); 
	var y_buffer = 36, x_buffer = 16; 
	var start_y = (gheight/2) - ((((ds_height - 1)/2) * y_buffer)), start_x = gwidth/2 ; 

	//draw the black background for the menu
	var c = c_black; 
	draw_rectangle_color(0,0, gwidth, gheight,c,c,c,c,false); 

	// draw the left side text
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right); 

	var left_text_x_position = start_x - x_buffer, left_text_y_position, x_offset; 

	var yy = 0; repeat(ds_height){
		left_text_y_position = start_y + (yy*y_buffer); 
		c = c_white;
		x_offset = 0;
	
		if(yy == menu_option[page]){
			c = c_red;
			x_offset = -(x_buffer/2);
		}
	
		draw_text_color(left_text_x_position + x_offset, left_text_y_position, ds_grid[# 0, yy],c,c,c,c,1); 
		yy++;
	}
	// draw the dividing line
	c = c_white;
	draw_line_color(start_x, start_y-y_buffer,start_x, left_text_y_position + y_buffer,c,c); 


	// draw the right side text

	draw_set_halign(fa_left);

	var right_text_x_position =  (start_x + x_buffer), right_text_y_position; 

	yy = 0; repeat(ds_height){
		right_text_y_position = start_y + (yy*y_buffer); 
	
		switch(ds_grid[# 1, yy]){
			case menu_element_type.shift:
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				c = c_white
				
				if(current_val == 0) left_shift = ""; 
				if(current_val == array_length_1d(ds_grid[# 4, yy])-1) right_shift = ""; 
				
				if(inputting and yy == menu_option[page]) {c = c_red;} 
				draw_text_color(right_text_x_position, right_text_y_position, left_shift + current_array[current_val] + right_shift, c, c,c ,c , 1)
			
				break; 
			
			case menu_element_type.slider:
				var len = 64;
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy]; 
				var circle_position = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			
				c = c_white
			
				draw_line_width(right_text_x_position, right_text_y_position, right_text_x_position+ len, right_text_y_position, 2);
				
				if(inputting and yy == menu_option[page]) {c = c_red;} 
				draw_circle_color(right_text_x_position + (circle_position*len), right_text_y_position, 4, c, c, false); 
				draw_text_color(right_text_x_position + (len * 1.2), right_text_y_position, string(floor(circle_position*100)) + "%" , c,c,c,c, 1); 
			
				break;
			case menu_element_type.toggle:
				var current_val = ds_grid[# 3, yy];
				var c1, c2;
				c= c_white;
				if(inputting and yy == menu_option[page]) {c = c_red;} 
			
				if(current_val == 0)	{c1 = c; c2 = c_dkgray}
				else					{c1 = c_dkgray; c2 = c}
			
				draw_text_color(right_text_x_position, right_text_y_position, "ON", c1, c1, c1, c1,1)  
				draw_text_color(right_text_x_position + 32, right_text_y_position, "OFF", c2, c2, c2, c2, 1); 
				break;
			
		}		
		yy++;
	}

	draw_set_valign(fa_top); 