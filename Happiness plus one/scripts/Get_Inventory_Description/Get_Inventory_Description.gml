///@description Get_Inventory_Description
///@arg item_id

var name
var item_id = argument0;
with(obj_inventory){
	name = ds_inventory_item_description[# 0, item_id];
	}
return name; 	
