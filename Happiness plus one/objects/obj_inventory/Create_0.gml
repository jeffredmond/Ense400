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


crafted_item_combos		= 11; 

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
	none					= 0, //height 1 
	flower					= 1, 
	stick					= 2, 
	old_rag					= 3,
	cup 					= 4, 	
	oil_in_cup				= 5,
	oil_rag					= 6, 
	stick_wrapped_in_rag	= 7, 
	torch					= 8,
	jokebook				= 9, //height 10
	crossbow				= 10,
	stick2					= 11,
	boxing_glove			= 12,	
	pillow					= 13,
	shoe					= 14,
	shoelace				= 15,
	knife					= 16,
	feather					= 17,
	crossbow_with_string	= 18,
	stick_with_feather		= 19, //height 20
	stick_with_bx_glv		= 20,
	boxing_glove_arrow		= 21,
	complete_crossbow		= 22,
	unlit_torch				= 23,
	
	height		= 24,
}

#endregion

#region possible item combinations

var array; 

//level 1 item combinations

	var ii = 0, zz = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.oil_in_cup;
	ds_inventory_crafted_combos[# ii++, zz]	= item.old_rag; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.oil_rag; 
	zz++; 
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick;
	ds_inventory_crafted_combos[# ii++, zz]	= item.old_rag; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_wrapped_in_rag; 
	zz++;
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.oil_rag;
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.unlit_torch; 
		zz++;
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_wrapped_in_rag;
	ds_inventory_crafted_combos[# ii++, zz]	= item.oil_in_cup; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.unlit_torch; 
	zz++;	

//level 2 crafted items combos 

	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.crossbow;
	ds_inventory_crafted_combos[# ii++, zz]	= item.shoelace; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.crossbow_with_string; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.knife;
	ds_inventory_crafted_combos[# ii++, zz]	= item.pillow; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.feather; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick2;
	ds_inventory_crafted_combos[# ii++, zz]	= item.feather; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_with_feather; 
	zz++;
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick2;
	ds_inventory_crafted_combos[# ii++, zz]	= item.boxing_glove; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_with_bx_glv; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_with_feather;
	ds_inventory_crafted_combos[# ii++, zz]	= item.boxing_glove; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.boxing_glove_arrow; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.stick_with_bx_glv;
	ds_inventory_crafted_combos[# ii++, zz]	= item.feather; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.boxing_glove_arrow; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.boxing_glove_arrow;
	ds_inventory_crafted_combos[# ii++, zz]	= item.crossbow_with_string; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.complete_crossbow; 
	zz++;	
	
//level 3 crafting item combination 	
	
	/*	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.;
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.;
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	zz++;	
	
	var ii = 0;  
	ds_inventory_crafted_combos[# ii++, zz]	= item.;
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	ds_inventory_crafted_combos[# ii++, zz]	= item.; 
	zz++;	
	*/ 
#endregion

#region item descriptions / and names 


//item name
	var z = 0, i = 0; 
	//level 1 item names  
	ds_inventory_item_description[# z, i++] = "nothing";
	ds_inventory_item_description[# z, i++] = "Flower";
	ds_inventory_item_description[# z, i++] = "Stick";
	ds_inventory_item_description[# z, i++] = "Old rag";
	ds_inventory_item_description[# z, i++] = "Cup";
	ds_inventory_item_description[# z, i++] = "Oil in a cup";
	ds_inventory_item_description[# z, i++] = "Oily rag";
	ds_inventory_item_description[# z, i++] = "Stick wrapped with rag";
	ds_inventory_item_description[# z, i++] = "Tourch";
	
	//level 2 item names 	
	ds_inventory_item_description[# z, i++] = "Jokebook";
	ds_inventory_item_description[# z, i++] = "Crossbow";
	ds_inventory_item_description[# z, i++] = "Stick";
	ds_inventory_item_description[# z, i++] = "Boxing glove";
	ds_inventory_item_description[# z, i++] = "Pillow";
	ds_inventory_item_description[# z, i++] = "Shoe";
	ds_inventory_item_description[# z, i++] = "Shoelace";
	ds_inventory_item_description[# z, i++] = "Knife";
	ds_inventory_item_description[# z, i++] = "Feather";
	ds_inventory_item_description[# z, i++] = "Crossbow with string";
	ds_inventory_item_description[# z, i++] = "Stick with feather";
	ds_inventory_item_description[# z, i++] = "Stick with boxing glove";
	ds_inventory_item_description[# z, i++] = "Boxing glove arrow";
	ds_inventory_item_description[# z, i++] = "completed crossbow";	
	
	// missed item from level 1
	ds_inventory_item_description[# z, i++] = "unlit tourch";
	
	//level 3 item names 
	//ds_inventory_item_description[# z, i++] = "";	
	//ds_inventory_item_description[# z, i++] = "";	
	//ds_inventory_item_description[# z, i++] = "";	
			
	
// item description	
	
	z = 1; i = 0; 
	//level 1 item descriptions
	ds_inventory_item_description[# z, i++] = "empty";
	ds_inventory_item_description[# z, i++] = "A cold looking flower";
	ds_inventory_item_description[# z, i++] = "This would make a terrible hat";
	ds_inventory_item_description[# z, i++] = "This might be a old pair of underwear";
	ds_inventory_item_description[# z, i++] = "It's a cracked little tea cup";
	ds_inventory_item_description[# z, i++] = "The oil seems to be happy in the cup";
	ds_inventory_item_description[# z, i++] = "Oh look, you've ruined the rag";
	ds_inventory_item_description[# z, i++] = "You have made the stick less dangerous";
	ds_inventory_item_description[# z, i++] = "This could be useful";
	
	// level 2 item descriptions 
	ds_inventory_item_description[# z, i++] = "It is full of terrible puns";
	ds_inventory_item_description[# z, i++] = "It's missing its string";
	ds_inventory_item_description[# z, i++] = "This stick looks familiar";
	ds_inventory_item_description[# z, i++] = "... Its red";
	ds_inventory_item_description[# z, i++] = "This pillow is as tall as you are and has a skeleton on it... spooky";
	ds_inventory_item_description[# z, i++] = "It says size 26";
	ds_inventory_item_description[# z, i++] = "This could be used as a string";
	ds_inventory_item_description[# z, i++] = "You feel uncomfrotable holding this";
	ds_inventory_item_description[# z, i++] = "Looks like a chicken feather";
	ds_inventory_item_description[# z, i++] = "Now what to use for ammo?";
	ds_inventory_item_description[# z, i++] = "For tickling from a safe distance";
	ds_inventory_item_description[# z, i++] = "For zoom punches";
	ds_inventory_item_description[# z, i++] = "This is rather unusual";
	ds_inventory_item_description[# z, i++] = "Perfect for knocking things over from a distance";

	// missed item from level 1
	ds_inventory_item_description[# z, i++] = "This tourch is missing the best part";
	
	//level 3 item descriptions
	//ds_inventory_item_description[# z, i++] = "";
	//ds_inventory_item_description[# z, i++] = "";


#endregion

var yy = 0; repeat(inv_slots){
	//ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	//ds_inventory[# 1, yy] = irandom_range(1, 5); 
	yy++; 
}	
 	//ds_inventory[# 0, 0] = item.stick;
 	//ds_inventory[# 0, 1] = item.flower;




var yy = 0; repeat(crafting_slots){
	ds_inventory_crafting[# 0, yy] = 0;
	ds_inventory_crafting[# 1, yy] = 0; 
	yy++;
}

// this should init the inventory after loading from tile or in game 
event_perform(ev_other, ev_user0);
