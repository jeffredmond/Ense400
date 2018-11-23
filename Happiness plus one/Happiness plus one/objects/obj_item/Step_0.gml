
var px = obj_player.x;
var py = obj_player.y;
var r = 64;

if(point_in_rectangle(px, py, x-r, y-r, x+r, y+r) && keyboard_check_pressed(ord("E")) ){
	//Are we on top of the player
	r = 2 
	if(point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
		x = lerp(x, px, 0.1);
		y = lerp(y, py, 0.1); 
		
	} else {
		var in = item_num;
		
		with(obj_inventory){
			var ds_inv		= ds_inventory; 	
			var picked_up	= false; 
			
			var i = 0; repeat(inv_slots){
				if(ds_inv[# 0, i] == item.none){
					ds_inv[# 0, i] = in;
					ds_inv[# 1, i] += 1; 
					picked_up = true;
					break;
				} else {
					i++;
				}
			}				
		}
		
		if(picked_up){
			with (obj_inventory){
			other.text += ds_inventory_item_description[# 0, in];
			}
			if(!instance_exists(obj_text)){
				with (instance_create_layer(x,y-64,layer,obj_text)){
					text = other.text; 
					length = string_length(text);
					}
					with (obj_camera){
						follow = obj_player; 	
					}
				}
				instance_destroy();	
			}
	}
}