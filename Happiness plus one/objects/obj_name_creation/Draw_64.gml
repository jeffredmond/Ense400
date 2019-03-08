/// @description drawing the character creation screen 
 

#region drawing "What is your name?"
	var str = "What is your name?"
	
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
	var nameSlot_buffer_y =  str_height; 
	var nameSlot_start_x = name_start_x, nameSlot_start_y = (name_start_y + (str_height/2) + nameSlot_buffer_y); 

	draw_set_font(font_CS_name); 
	var c = c_white;	
	draw_set_valign(fa_top); 
	draw_set_halign(fa_center); 
	draw_text_color(nameSlot_start_x, nameSlot_start_y, global.player_name, c, c, c, c, 1); 
	
#endregion


#region drawing the keyboard and options 

// information about string manipulation string_delete(str, index, count); count is the number of things to be deleted 
	// this delets an element from a string. 
	// use in unision with this string_length(str);

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

//exit; 

repeat (total_keys){
	
	var char_key= chr(ds_grid[# key_index_x, key_index_y]); 

	 key_start = (gridwidth)* (strwdth+keyb_buffer_x); 
	 
	// x, y location for each sprite in the inventory
	draw_set_halign(fa_center); 
	draw_set_font(font_CS_keyboard); 
	xx = (gwidth/2 - key_start/2) + (( strwdth + keyb_buffer_x) * item_x );
	yy = slots_y + ((cell_size + keyb_buffer_y) * item_y ) + name_start_y + nameSlot_start_y + (str_height*scale); 
	
	//buttons need specific locations to print and shit 
	if(key_index >= uppr_lwr && key_index <= Back) {
		char_key = ds_grid[# key_index_x, key_index_y];
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
			draw_text_color(xx, yy, char_key, c, c, c, c, 1);
			c = c_white;
		break;	
			
		default:
			draw_text_color(xx, yy, char_key,c,c,c,c,1); 	
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

/*


#region drawing the crafting section 
//this section will be for drawing the two squares used for crafting 
var i = 0 
var cxx;
var cyy;
var spr_cx;
var spr_cy;
var craft_curr_item; 

//draw the crafting slot items 
repeat (crafting_slots){
	
	//cxx = slots_x + ((cell_size + x_buffer) * item_x * scale);
	//cyy = slots_y + ((cell_size + y_buffer) * item_y * scale); 
	
	craft_x = craft_box_x + ((cell_size * i) * scale);
	craft_y = craft_box_y; 
	// the item in the craft slot 
	craft_curr_item = craft_grid[# 0, i]; 
	spr_cx = (craft_curr_item mod spr_inv_items_columns) * cell_size; 
	spr_cy = (craft_curr_item div spr_inv_items_columns) * cell_size;
	
	
	draw_sprite_part_ext(//draw the empty square that we have in the top left of the spr_inv_ui
		spr_inv_UI, 0, 0, 0, cell_size, cell_size, craft_x, craft_y, scale,
		scale, c_white, 1 
	); 
	
	draw_sprite_part_ext(//draw the sprite that is in the current spot in our crafting screen
	spr_inv_items, 0, spr_cx, spr_cy, cell_size, cell_size, craft_x, craft_y,
	scale, scale, c_white, 1
	); 
	
	//increment
	i++; 
}
	
	//draw the craft button 
	draw_sprite_part_ext(
		spr_inv_UI, 0, 0, cell_size, 
		craft_button_width, craft_button_height, craft_button_dx, craft_button_dy, 
		scale, scale, c_white, 1
	);
	// draw the result square
	draw_sprite_part_ext(
		spr_inv_UI, 0, 0, 0, cell_size, cell_size, crafted_item_box_x, crafted_item_box_y, scale,
		scale, c_white, 1
	); 
#endregion

#region crafting

if(start_crafting){
	
	//step one: there are two items in the crafting slots and the button is highlighted 
	gpu_set_blendmode(bm_add)
	draw_sprite_part_ext(
		spr_inv_UI, 0, 0, cell_size, 
		craft_button_width, craft_button_height, craft_button_dx, craft_button_dy, 
		scale, scale, c_red, 1
	);
	gpu_set_blendmode(bm_normal)
	
	//step two: the player has pushed enter while the button was pressed. now the inventory will check to see 
	//if the two object in the crafting slots create a valid combination. 
		var j = 0;

		//var craft_result;
		var current_array; 
		
		var cur_ds_grid = ds_inventory_crafted_combos; 
		var crafting_check = ds_inventory_crafting; 
	
	if(crafting_happening){
		repeat(crafted_item_combos){	
			if((crafting_check[# 0, 0] == cur_ds_grid[# 0, j]) && (crafting_check[# 0, 1] == cur_ds_grid[# 1, j])){ 
				SUCCESS = true;		
				craft_result = cur_ds_grid[# 2, j]; 
			}
			if((crafting_check[# 0, 0] == cur_ds_grid[# 1, j]) && (crafting_check[# 0, 1] == cur_ds_grid[# 0, j])){ 
				SUCCESS = true;
				craft_result = cur_ds_grid[# 2, j]; 
			}
			if(SUCCESS) break;
			j++; 
		}
		FAILURE = !SUCCESS; 
		crafting_happening = false; 
	}	
	
	if(FAILURE){
		for(var i = 0; i < crafting_slots; i++){
			for(var j = 0; j < crafting_slots; j++){
				ds_inventory_crafting[# i, j] = 0; 
			}
		}
		start_crafting = false;	
		ccs = 0;
		FAILURE = false; 
		crafting_step = 0; 
		//possible display a message in here that will say the combination does not work
	}
	
	var spr_crx, spr_cry; 
	
	if(SUCCESS){
		if(ds_inventory_crafting[# 0,0] > 0){
			//keep track of an inventory slot to insert the result into 

			
			tmp_inv_spot = min(ds_inventory_crafting[# 1, 0], ds_inventory_crafting[# 1, 1]); 
			
			//need to get rid of the objects that are in the iventory screen. 
			ds_inventory[# 0,ds_inventory_crafting[# 1,0]] = 0;
			ds_inventory[# 1,ds_inventory_crafting[# 1,0]] = 0;
			ds_inventory[# 0,ds_inventory_crafting[# 1,1]] = 0;
			ds_inventory[# 1,ds_inventory_crafting[# 1,1]] = 0;


			//get rid of the object in the crafting squares
			for(var i = 0; i < crafting_slots; i++){
				for(var j = 0; j < crafting_slots; j++){
					ds_inventory_crafting[# i, j] = 0; 
				}
			}
		}
		//draw the result in the result square 
		spr_crx = (craft_result mod spr_inv_items_columns) * cell_size; 
		spr_cry = (craft_result div spr_inv_items_columns) * cell_size;	

		draw_sprite_part_ext(
			spr_inv_items, 0, spr_crx, spr_cry, cell_size, cell_size, crafted_item_box_x, crafted_item_box_y, scale,
			scale, c_white, 1
		); 	 	
	}
}

if(crafting_finished)
{
	ds_inventory[# 0,tmp_inv_spot] = craft_result;
	crafting_finished = false; 
}

#endregion


