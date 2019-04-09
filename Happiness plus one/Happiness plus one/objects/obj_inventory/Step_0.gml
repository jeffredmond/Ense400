/// @description Insert description here
// You can write your code in this editor
if(!global.showInventory) exit; 

#region move around inventory

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_left_p	= keyboard_check_pressed(global.key_left);
input_right_p	= keyboard_check_pressed(global.key_right);
input_enter_p	= keyboard_check_pressed(global.key_enter); 
input_backsp_p  = keyboard_check_pressed(global.key_backspace); 


var ochange_lr = input_right_p - input_left_p; 
var ochange_ud = input_down_p  - input_up_p; 
var row = cur_selected div inv_slots_height; 

if(start_crafting){
	ochange_lr = 0;
	ochange_ud = 0; 
}

if(ochange_lr != 0){
	cur_selected += ochange_lr;
	if(cur_selected < 0) cur_selected = inv_slots_width -1; 
	
	if(cur_selected < (row * inv_slots_width)) cur_selected = row * inv_slots_width + (inv_slots_width -1); 
	if(cur_selected > (row * inv_slots_width + (inv_slots_width -1))) cur_selected = row * inv_slots_width;
	
	if(cur_selected > (inv_slots - 1))  cur_selected = row * inv_slots_width ;
}
//up is -1 and down is 1 
if(ochange_ud != 0){	
	switch(row){
		case(0):
			if(ochange_ud == 1){
				cur_selected += inv_slots_width; 	
			}
			if(ochange_ud == -1){
				cur_selected = (inv_slots_width * (inv_slots_height - 1) + cur_selected); 
			}
		break;
		case(1): 
			cur_selected += ochange_ud*inv_slots_width; 
		break;
		case(2):
			if(ochange_ud == 1){
				cur_selected = ( cur_selected - (row * inv_slots_width));
			}
			if(ochange_ud == -1){
				cur_selected -= inv_slots_width; 
			}
		break;
	}	
}

#endregion

#region move selected items to the crafting screen and craft  

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