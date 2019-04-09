///@description check inventory 
///@arg inventoryItem

var inv = argument0; 
var result = false; 
	with(obj_inventory){
		var ds_inv		= ds_inventory; 		
		var i = 0; repeat(inv_slots){
			if(ds_inv[# 0, i] == inv){
				result = true; 
				break; 
			} else {
				i++;
			}
		}				
	}
if (result) TextBox_End_Action();
else { instance_destroy();}  	
