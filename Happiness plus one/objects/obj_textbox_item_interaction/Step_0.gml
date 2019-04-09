
// this is where i can do the typewritter style text display as well as the sound effects
// for where each letter is drawn 

if(interacting){
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
	
	if(input_enter_p){
		if(done_interacting == true){instance_destroy();}
		if(!done_interacting){
			switch(cur_selected){
				case(NO):
					instance_destroy(); 
				break;
				case(YES):
				
				/////////////////////////////////
				//this section checks to see if you have the necissary items 
					if(needed_item == item.none){
						item_acquired = true; 
					
					} else {
						with(obj_inventory){
							var ds_inv		= ds_inventory; 	
			
							var i = 0; repeat(inv_slots){
								if(ds_inv[# 0, i] == other.needed_item){
									other.item_in_inventory = true;
									ds_inv[# 0, i] = item.none; 
									break;
								} else {
									i++;
								}
							}				
						}
					}	
					
					//////////////////////////////////////////////////////////////////////
					// this section is responsible for putting object into the inventory//
					if(item_in_inventory || item_acquired){
					var in = resulting_item;
		
						with(obj_inventory){
							var ds_inv		= ds_inventory; 	
			
							var i = 0; repeat(inv_slots){
								if(ds_inv[# 0, i] == item.none){
									ds_inv[# 0, i] = in;
									ds_inv[# 1, i] += 1; 
									other.picked_up = true;
									break;
								} else {
									i++;
								}
							}	if( i == inv_slots && other.picked_up == false)	other.InvIsFull = true;		
						}	
					}
					
					//////////////////////////////////////////////
					if(picked_up = true){
						//filthiest thing that i have done all day 
						with(obj_player){
						var inst  = collision_rectangle( x - radius, y - radius, x + radius, y + radius, obj_item_interaction, false, false)		
							with(inst){
								has_been_picked_up = true; 
								if(orig_sprite != noone){
									sprite_indx++; 
								}								
							}
						}
						
						if(item_in_inventory){
							response_reqitem_success1 += Get_Inventory_Description(needed_item)
							response_reqitem_success2 += Get_Inventory_Description(resulting_item)
							response_master += response_reqitem_success1; 
							response_master += response_reqitem_success2;
						}
						if (item_acquired) {
							response_default_success += Get_Inventory_Description(resulting_item); 
							response_master += response_default_success; 					
						}
					
					} else {
						if (InvIsFull) {
							response_master = response_inv_full;
						}
						else if(needed_item != item.none && item_in_inventory == false){
							response_master += response_reqitem_fail; 
						} 
					}
				interacting = false; 
				done_interacting = true; 	
				page = 0; 
				text = -1;
				text[0] = response_master; 
				event_perform(ev_other, ev_user1); 
				break;			
			}
		}
	}
	
	exit; 
}

//standard case for progressing the text in the text box
if(keyboard_check_pressed(interact_key)){
	if(letters < str_len){letters = str_len; } 
	else if(page < array_length_1d(text) -1){
		page++;	
		event_perform(ev_other, ev_user1); 
	} else { 
		if(done_interacting) instance_destroy(); 
		if(!picked_up)interacting = true; 	
		else {instance_destroy();}
		}
}
