///@description step event for the character creation screen 


//	make the image to be selected float in the air and look hella dope. 
	yimage_position = sin(get_timer()/500000)*yimage_position_scale; 
	


	#region move around keyboard 

	input_left_p	= keyboard_check_pressed(key_left);
	input_right_p	= keyboard_check_pressed(key_right);
	input_enter_p	= keyboard_check_pressed(key_enter); 


	var ochange_lr = input_right_p - input_left_p; 

	var last_row_offset = 6; 

	if(ochange_lr != 0){	
		cur_selected += ochange_lr;
		if(cur_selected < 0) cur_selected = 1; 
		if(cur_selected > 1) cur_selected = 0;
	}
	
	#endregion


	#region selecting charcaters and other options 

	if(input_enter_p){
		switch(cur_selected){
			case(Back):
				room_goto(rm_Title_Screen);
				instance_destroy(obj_load_screen); 
			break;
			case(AccName):
				if (name != "<EMPTY>"){
					load_game(); 
				}
			break;			
		}
	}


	#endregion	

