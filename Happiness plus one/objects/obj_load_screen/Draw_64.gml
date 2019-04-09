/// @description drawing the character creation screen 
 

	#region drawing the save file name. 

		var str = name; 
		var savefile = "Load Game:"
		draw_set_font(font_titleScreen_options); 
		var strh = string_height(str); 
		var scale = 1; 
		
		
		var gwidth = view_width, gheight = view_height; 
		var name_x_buffer = 32, name_y_buffer = gheight/3;
		var name_start_x = gwidth/2, name_start_y = gheight/2; 
		var c = c_white; 
		draw_set_valign(fa_top); 
		draw_set_halign(fa_center); 

		draw_text_color(name_start_x, name_start_y - name_y_buffer, savefile, c, c, c, c, 1); 
		draw_text_color(name_start_x, name_start_y - name_y_buffer + strh*scale , str, c, c, c, c, 1); 

	#endregion

	// drawing the current progess image  
	if(name != "<EMPTY>"){
		var imgscl	= 3; 
		var str_height = string_height(str); 
		var sin_y = yimage_position; 
		var progimage_buffer_y =  str_height; 
		var progimage_x_start_offset = ((sprite_get_width(image_sprite_name)/4)/2)*imgscl; 
		var progimage_start_x = name_start_x - progimage_x_start_offset, progimage_start_y = gheight/3 + sin_y; 

		draw_sprite_part_ext(			
		image_sprite_name, 0, image_x_position*image_cell_size, image_y_position*image_cell_size,
		image_cell_size, image_cell_size, progimage_start_x, progimage_start_y,imgscl, imgscl, c, 1)

	// drawing the time  
			
		var start_time_min_x = gwidth/2
		var start_time_min_y = gheight/3 + (yimage_position_scale) + time_image_buffer_y + image_cell_size*imgscl;  
		draw_text_color(start_time_min_x, start_time_min_y, total_time_ms, c, c, c, c, 1);
	 }

	#region drawing the buttons 

	// good button position var start_time_min_y = gheight/2 + gheight/3 
	var list = buttons; 
	
	var curbutn = 0; 
	var butn_buffer_x = 64; 
	
	var butn_start_x = gwidth/2 - butn_buffer_x; 
	
	repeat (numbtn){
		
		// x, y location for each button 
		draw_set_halign(fa_center); 
		
		var butn_str = list[| curbutn]; 
		var xx = butn_start_x + butn_buffer_x * curbutn * 2; 
		var yy = gheight/2 + gheight/3
		c = c_white; 
		
		if(curbutn == cur_selected) {
			c = c_red; 
			draw_text_color(xx, yy, butn_str, c, c, c, c, 1);
		}
		else{
		draw_text_color(xx, yy, butn_str, c, c, c, c, 1); 
		}	
		curbutn++; 
		
	}
		// if currselected then draw the button red
		// 
	#endregion
 
 

