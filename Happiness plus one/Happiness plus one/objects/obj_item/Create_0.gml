

// so if i have anyting to do with the depth controlling object i will need to have 
// event_inherited(); here 

cell_size			= 64; 
item_spr			= spr_inventory_items;
spr_width			= sprite_get_width(item_spr);
spr_height			= sprite_get_height(item_spr); 

item_num			= -1; 
x_frame				= 0; 
y_frame				= 0;

x_offset			= cell_size/2;
y_offset			= cell_size*(2/3); 

text 				= "You picked up a "; 