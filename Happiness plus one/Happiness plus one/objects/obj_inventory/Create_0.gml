/// @description Insert description here
// You can write inventory

global.showInventory = false; 

depth					= 1; 
scale					= 1; 
cell_size				= 64; 
cell_frame_thickness	= 4;

cur_selected			= 1;
item_selected			= -1; 


//crafting section 
crafting_slots			= 2; 
craft_box_x				= 320; 
craft_box_y				= 64 ; 
ccs						= 0; 
tmp_inv_spot			= 0; 

start_crafting			= false; 
crafting_happening		= false;
crafting_finished		= false; 
SUCCESS					= false;
FAILURE					= false; 

crafting_step			= 0; 

starting				= 0;
happening				= 1;
finished				= 2; 


crafted_item_combos		= 2; 

crafted_item_box_x		= 353;
crafted_item_box_y		= 193; 

craft_button_x 			= 353;
craft_button_y			= 161;
craft_button_width		= 64 ;
craft_button_height		= 16 ;
craft_button_dx			= 352; 
craft_button_dy			= craft_button_y - 1; 

inv_slots				= 9; 
inv_slots_width			= 3;
inv_slots_height		= 3; 
total_num_of_items		= 9; 

//distance between each inventory item square
x_buffer				= 0;
y_buffer				= 0; 

inv_UI_width			= 512;
inv_UI_height			= 384; 

gui_width				= display_get_gui_width();
gui_height				= display_get_gui_height(); 

spr_inv_UI				= spr_inventory_UI; 
spr_inv_items			= spr_inventory_items;

spr_inv_items_columns	= sprite_get_width(spr_inv_items)/cell_size; 
spr_inv_items_rows		= sprite_get_height(spr_inv_items)/cell_size; 


inv_UI_x				= 0;
inv_UI_y				= 0; 

slots_x					= inv_UI_x + (65 * scale);
slots_y					= inv_UI_y + (64 * scale); 

//region for drawing text from descriptions

//149, 300
desc_x					= inv_UI_x; 
desc_y					= 300 * scale; 
text_box_width			= 370; 

// inventory
// 0 = ITEM
// 1 = NAME?? 

ds_inventory = ds_grid_create(2, inv_slots); 
ds_inventory_item_description = ds_grid_create(2, item.height);
ds_inventory_crafting = ds_grid_create(2, crafting_slots); 
ds_inventory_crafted_combos = ds_grid_create( 3, crafted_item_combos); 

#region items
enum item {
	none		= 0,
	item1		= 1, 
	item2		= 2,
	item3		= 3,
	item4		= 4,
	item5		= 5,
	item6		= 6,
	height		= 7,
}

#endregion

#region possible item combinations

var array; 
	var ii = 0, zz = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.item1;
	ds_inventory_crafted_combos[# ii++, zz]	= item.item2; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.item3; 
	var ii = 0, zz = 1;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.item4;
	ds_inventory_crafted_combos[# ii++, zz]	= item.item5; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.item6; 

#endregion

#region item descriptions
	//item name
var z = 0, i = 0; 
	ds_inventory_item_description[# z, i++] = "nothing";
	ds_inventory_item_description[# z, i++] = "item1";
	ds_inventory_item_description[# z, i++] = "item2";
	ds_inventory_item_description[# z, i++] = "item3";
	ds_inventory_item_description[# z, i++] = "item4";
	ds_inventory_item_description[# z, i++] = "item5";
	ds_inventory_item_description[# z, i++] = "item6";
	
	// item description
	z = 1; i = 0; 
	ds_inventory_item_description[# z, i++] = "empty";
	ds_inventory_item_description[# z, i++] = "this is item1";
	ds_inventory_item_description[# z, i++] = "this is item2";
	ds_inventory_item_description[# z, i++] = "this is item3";
	ds_inventory_item_description[# z, i++] = "this is item4";
	ds_inventory_item_description[# z, i++] = "this is item5";
	ds_inventory_item_description[# z, i++] = "this is item6";

#endregion

var yy = 0; repeat(inv_slots){
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 5); 
	yy++; 
}	
	ds_inventory[# 0, 0] = 1;
	ds_inventory[# 0, 1] = 2;
	ds_inventory[# 0, 2] = 4;
	ds_inventory[# 0, 3] = 5;

var yy = 0; repeat(crafting_slots){
	ds_inventory_crafting[# 0, yy] = 0;
	ds_inventory_crafting[# 1, yy] = 0; 
	yy++;
}

