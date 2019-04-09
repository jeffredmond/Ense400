/// @description drawing the character creation screen 
 
	 if(!name_accepted){
	#region drawing "What is your name?"
		var str = "Who are you?"
	
		var gwidth = view_width, gheight = view_height; 
		var name_x_buffer = 32, name_y_buffer = 32;
		var name_start_x = gwidth/2, name_start_y = 32; 
	
		var c = c_white; 
		draw_set_valign(fa_top); 
		draw_set_halign(fa_center); 
		draw_set_font(font_CS_title); 
		draw_text_color(name_start_x, name_start_y, str, c, c, c, c, 1); 

	#endregion

	#region drawing the name slot 
	
		var str_height = string_height(str); 
		var rnd_x = random_range(-1, 1); 
		var rnd_y = random_range(-1, 1); 
		var nameSlot_buffer_y =  str_height; 
		var nameSlot_start_x = name_start_x, nameSlot_start_y = (name_start_y + (str_height/2) + nameSlot_buffer_y); 

		draw_set_font(font_CS_name); 
		var c = c_white;	
		draw_set_valign(fa_top); 
		draw_set_halign(fa_center); 
		draw_text_color(nameSlot_start_x + rnd_x, nameSlot_start_y + rnd_y, global.player_name, c, c, c, c, 1); 
	
	#endregion


	#region drawing the keyboard and options 

	var keyb_buffer_x = 32, keyb_buffer_y = 16; 
	var ds_grid = array_keyboards[currkeyboard], ds_height = ds_grid_height(ds_grid)

	var xx, yy; 
	var key_index = 0; 
	var	key_index_x = 0, key_index_y = 0;
	var item_x = 0, item_y = 0; 
	var c = c_white; 
	var scale = 2; 

	var charwidth = 0, key_start = 0;  
	var gridwidth = ds_grid_width(ds_grid); 
	var strwdth = string_width("W"); 

	var cell_size = 32; 

	//variables for the buttons
	var back_button_x = 0;
	var back_button_y = 0;  
	var back_button_x_buffer = 128; 

	var uppr_lwr_button_x = 0; 
	var uppr_lwr_button_y = 6;
	var uppr_lwr_button_x_buffer = back_button_x_buffer/2; 

	var acc_button_x = 3;
	var acc_button_y = 6; 	
	var acc_button_x_buffer = 128; 
	var char_key1 = "a" ; 
	 

	repeat (total_keys - 3){
		
		if(key_index < uppr_lwr )var char_key1 = chr(ds_grid[# key_index_x, key_index_y]); 

		 key_start = (gridwidth)* (strwdth+keyb_buffer_x); 
	 
		// x, y location for each sprite in the inventory
		draw_set_halign(fa_center); 
		draw_set_font(font_CS_keyboard); 
		xx = (gwidth/2 - key_start/2.5) + (( strwdth + keyb_buffer_x) * item_x );
	
		yy = slots_y + ((cell_size + keyb_buffer_y) * item_y ) + name_start_y + nameSlot_start_y + (str_height*scale); 
	
		//buttons need specific locations to print and shit 
		if(key_index >= uppr_lwr && key_index <= Back) {
			char_key1 = ds_grid[# key_index_x, key_index_y];
			switch(key_index){
		
			case uppr_lwr:
				draw_set_halign(fa_left);
				xx = (gwidth/2 - key_start/2) + (( strwdth + keyb_buffer_x) * uppr_lwr_button_x) - uppr_lwr_button_x_buffer;
				yy = ((cell_size + keyb_buffer_y) * uppr_lwr_button_y ) + name_start_y + nameSlot_start_y + (str_height*scale); 
			break;
		
			case AccName:
				draw_set_halign(fa_left);
				xx = (gwidth/2 - key_start/2) + (( strwdth + keyb_buffer_x) * acc_button_x) + acc_button_x_buffer;
				yy = ((cell_size + keyb_buffer_y) * acc_button_y ) + name_start_y + nameSlot_start_y + (str_height*scale); 

			break; 
		
			case Back:
				draw_set_halign(fa_left);
				xx = (gwidth/2 - key_start/2) + (( strwdth + keyb_buffer_x) * back_button_x ) - back_button_x_buffer;
				yy = ((cell_size + keyb_buffer_y) * back_button_y ) + name_start_y + nameSlot_start_y + (str_height*scale); 
			break;
			}
		}
	//printing the characters to the screen. 
			switch(key_index){
			case cur_selected:
				c = c_red; 
				draw_text_color(xx, yy, char_key1, c, c, c, c, 1);
				c = c_white;
			break;	
			
			default:
				draw_text_color(xx, yy, char_key1,c,c,c,c,1); 	
			break;
		}
	
			// increment 
		key_index += 1;
		item_x = key_index mod keyboard_width;
		item_y = key_index div keyboard_width; 
		key_index_x +=1; 
		if(key_index_x mod keyboard_width == 0 && key_index > 0)
			{
				key_index_y++; 
				key_index_x = 0; 
			}
	}

	#endregion
 }
 	#region minicutscene after player name selected 
 
 if (name_accepted){
	 
	var fdmount = current_fade[some_god_damn_varname]; 
	var name_message_y_buffer = (string_height(message)/2); 
	var gwidth = view_width;
	var gheight = view_height; 
	
	var name_x = gwidth/2;
	var name_y = gheight/2 + name_message_y_buffer; 
	
	var message_x = name_x; 
	var message_y = name_y; 
	c = c_white; 
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	
	// draw the name
	 draw_text_color(name_x, name_y, global.player_name, c, c, c, c, fdmount); 
	 
	// draw the message
	draw_set_valign(fa_top)
	draw_text_color(message_x, message_y, message, c, c, c, c, fdmount);  
	 
 }
 
	#endregion