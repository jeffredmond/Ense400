/// @description initialize after loading from title

if(ds_map_size(game.inventory_buffer) > 0 ){
	var bb = 0; 
	repeat(inv_slots){
		ds_inventory[# 0, bb] = game.inventory_buffer[? "item" + string(bb)];
		bb++
	}
}