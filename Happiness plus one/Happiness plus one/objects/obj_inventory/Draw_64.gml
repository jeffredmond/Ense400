/// @description drawing the inventory

if(!global.showInventory) exit; 

// drawing the background of the inventory 
draw_sprite_part_ext(	
	spr_inv_UI, 0, cell_size, 0, inv_UI_width, 
	inv_UI_height, inv_UI_x, inv_UI_y, scale, scale, c_white, 1
	);

#region drawing the inventory section of the inventory

// drawing the inventory sprites
// inital variables 
var item_index;

var item_x, item_y;
var xx, yy; 
var inv_curr_item; 
var inv_grid; 
var spr_x, spr_y; 
var result_x, result_y; 
var button_x, button_y;

var craft_index;
var craft_x, craft_y;
var crafted_x, crafted_y;
var craft_grid;

item_index = 0; 
item_x = 0; 
item_y = 0; 
inv_grid = ds_inventory; 
craft_grid = ds_inventory_crafting; 

repeat (inv_slots){
	// x, y location for each sprite in the inventory
	xx = slots_x + ((cell_size + x_buffer) * item_x * scale);
	yy = slots_y + ((cell_size + y_buffer) * item_y * scale); 
	//the distance to the next square is 65 pixels 
	
	// the item
	inv_curr_item = inv_grid[# 0, item_index]; 
	spr_x = (inv_curr_item mod spr_inv_items_columns) * cell_size; 
	spr_y = (inv_curr_item div spr_inv_items_columns) * cell_size;
	// draw slot and item
	draw_sprite_part_ext(//draw the empty square that we have in the top left of the spr_inv_ui
		spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale,
		scale, c_white, 1 
	); 
	switch(item_index){
		case cur_selected:
			if(inv_curr_item > 0)  draw_sprite_part_ext(//draw the sprite that is in the current spot in our inventory
				spr_inv_items, 0, spr_x, spr_y, cell_size, cell_size, xx, yy,
				scale, scale, c_white, 1
				); 
			if(!start_crafting){
				gpu_set_blendmode(bm_add);	
				draw_sprite_part_ext( // draw a lightened sprite if it is currently selected 
						spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale,
						scale, c_white, 1 
					); 	
				gpu_set_blendmode(bm_normal);
			}
		break;	
			
		default:
			if(inv_curr_item > 0)  draw_sprite_part_ext(//draw the sprite that is in the current spot in our inventory
				spr_inv_items, 0, spr_x, spr_y, cell_size, cell_size, xx, yy,
				scale, scale, c_white, 1
				); 
		break;
	}
	// draw item number
	/*
	if(inv_curr_item > 0){
		c = c_black; 
		var number = inv_grid[# 1, item_index];
		draw_text_color(xx + (cell_frame_thickness*scale), yy + (cell_frame_thickness*scale), string(number), c, c, c, c, 1); 
	}
	*/
	// increment 
	item_index += 1;
	item_x = item_index mod inv_slots_width;
	item_y = item_index div inv_slots_width; 
}

#endregion

//draw  item description

var iinfo_grid = ds_inventory_item_description, description = ""; 
inv_curr_item = inv_grid[# 0, cur_selected]; 

if(inv_curr_item > 0) {
	draw_set_font(font_inventory_text);
	draw_set_halign(fa_left)
	description = iinfo_grid[# 0, inv_curr_item] + ". " + iinfo_grid[# 1, inv_curr_item]; 	
	var c = c_black;  
	draw_text_ext_color(
	desc_x + cell_size + cell_frame_thickness, desc_y, description,
	string_height("M"), text_box_width, c, c,c, c, 1
	); 
}




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
			/*
			var iii = 0; repeat(inv_slots){
				if(ds_inventory[# 0, iii] == item.none){
					tmp_inv_spot = ds_inventory[# 0, iii]; 
					break; 
				}
				iii++; 
			}
			*/
			
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


