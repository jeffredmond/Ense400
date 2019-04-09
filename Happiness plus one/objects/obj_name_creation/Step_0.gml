// step event for the character creation screen 


if(!name_accepted) {
	#region move around keyboard 

	input_up_p		= keyboard_check_pressed(key_up);
	input_down_p	= keyboard_check_pressed(key_down);
	input_left_p	= keyboard_check_pressed(key_left);
	input_right_p	= keyboard_check_pressed(key_right);
	input_enter_p	= keyboard_check_pressed(key_enter); 
	input_backsp_p  = keyboard_check_pressed(key_backspace); 


	var ochange_lr = input_right_p - input_left_p; 
	var ochange_ud = input_down_p  - input_up_p; 
	var row = cur_selected div keyboard_width; 
	var last_row_offset = 6; 

	if(ochange_lr != 0){	
		if(cur_selected == uppr_lwr) cur_selected = AccName; 
	
		else if (cur_selected == AccName) cur_selected = uppr_lwr; 
		else if (cur_selected == Back) cur_selected = cur_selected; 
		else {
			//i have no idea what is going on here 
			cur_selected += ochange_lr;
			if(cur_selected < 0) cur_selected = keyboard_width - 1; 
			if(cur_selected < (row * keyboard_width) && row != 3) cur_selected = row * keyboard_width + (keyboard_width -1); 
			if(cur_selected < (row * keyboard_width) && row == 3) cur_selected = row * keyboard_width + (keyboard_width -1) - last_row_offset; 
			if(cur_selected > ((row * keyboard_width) + (keyboard_width -1))) cur_selected = row * keyboard_width;
			if(cur_selected > ((ds_key_size - last_row_offset) - 1))  cur_selected = row * keyboard_width ;
		}
	}
	//up is -1 and down is 1 
	if(ochange_ud != 0){	
		switch(row){
			case(0):
				if(ochange_ud == 1){
					cur_selected += keyboard_width; 	
				}
				if(ochange_ud == -1){
					cur_selected = Back; 
				}
			break;
			case(2):
				if((ochange_ud == 1) && ((cur_selected != (row)*keyboard_width) || (cur_selected != (row)*keyboard_width + 1)))
					{
					cur_selected = (row + 1) * keyboard_width; 	
					}
				else cur_selected += ochange_ud*keyboard_width;
				break; 
			case(3):
				if(ochange_ud == 1){
					if(cur_selected == Back) {
						cur_selected = 0; 	
					}				
					if(cur_selected == ((row)*keyboard_width) || cur_selected == ((row)*keyboard_width) + 1){
						cur_selected = uppr_lwr; 
					}
				}
				if(ochange_ud == -1){
					if(cur_selected == uppr_lwr || cur_selected == AccName)
						{	
							cur_selected = ((row)*keyboard_width)
						}
					else if (cur_selected != Back) {
						cur_selected -= keyboard_width;
					}
				}
			break;
			default: 
				cur_selected += ochange_ud*keyboard_width; 			
			break;
		}	
	}

	#endregion


	#region selecting charcaters and other options 

	var curr_char_x		= cur_selected mod keyboard_width;
	var curr_char_y		= cur_selected div keyboard_width;
	var ds_grid			= array_keyboards[currkeyboard]; 
	var max_name_size	= 10;  

	if(input_enter_p){
		switch(cur_selected){
			case(Back):
				room_goto(rm_Title_Screen);
			break;
		
			case(uppr_lwr):
					currkeyboard += 1; 
					if(currkeyboard > 1) currkeyboard = 0; 
			break;
		
			case(AccName):
		
				// i will add in the save function at one point 
			
				// start name accepted section
				name_accepted = true; 
				with(game){
					total_time	= 0; 
				}
			break;
		
			default:
				var str_lngth = string_length(global.player_name);
				var new_char= chr(ds_grid[# curr_char_x, curr_char_y]); 
				if (str_lngth < max_name_size)
				{
					//string_insert( new_char, global.player_name, str_lngth); 	
					global.player_name += new_char; 
				}
			break; 
				
		}
	}

	if(input_backsp_p){
	
		str_lngth = string_length(global.player_name);
		if (str_lngth >= 0)
		{
			global.player_name = string_delete(global.player_name, str_lngth, 1); 	
		}
	}	
	#endregion	
}
////////////////////////////////////////////////////////////////////////////////////
// this section is responsible for after the player accepts their name
// it will fade in from black, display a message for message_time seconds
// then fade out. after it is faded out the game will transfer over to the 
// first room. 
if(name_accepted){
	var currfd = current_fade[some_god_damn_varname]; 

	if(some_god_damn_varname == 0 && currfd != fade_out)current_fade[some_god_damn_varname] += fade_rate;
	if (currfd == fade_out) {
		message_curr++; 
		if (message_curr == message_time)some_god_damn_varname++;
	}
	if( some_god_damn_varname == 1) current_fade[some_god_damn_varname] -= fade_rate; 
	if(currfd == 0 && some_god_damn_varname == fade_out) room_goto(rm_lv1_1); 
}