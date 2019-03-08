// step event for the character creation screen 

//exit; 

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


if(input_enter_p){
	if(ccs < (crafting_slots) && ds_inventory[# 0, cur_selected] != 0) {
		item_selected = cur_selected;	
		ds_inventory_crafting[# 0, ccs] = ds_inventory[# 0, item_selected] 
		ds_inventory_crafting[# 1, ccs] = item_selected; 
		if(ccs < crafting_slots) ccs++;
	}
	if(ccs == crafting_slots) {	
		switch(crafting_step){
			case(starting):
				start_crafting = true;
				crafting_step++; 
			break;
			
			case(happening):
				crafting_happening = true;
				crafting_step++; 
			break;
			
			case(finished):
				if(SUCCESS){
					SUCCESS = false; 
					crafting_finished = true; 
					start_crafting = false; 
					ccs = 0; 
					crafting_step = 0; 
				}
			break; 	
		}
	}
}

if(input_backsp_p && ccs > 0){
	ds_inventory_crafting[# 0, ccs-1] = 0;
	ds_inventory_crafting[# 1, ccs-1] = 0;	
	ccs--; 
	crafting_step--; 
	if(crafting_step <= 1) start_crafting = false; 	
	if(SUCCESS)
	{
		ds_inventory[# 0,tmp_inv_spot] = craft_result;
	}
}

#endregion