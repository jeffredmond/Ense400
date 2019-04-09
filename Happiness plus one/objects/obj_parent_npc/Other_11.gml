/// @description Insert description here
// You can write your code in this editor

var key = object_get_name(object_index);
var check = dialog_array; 
with(game){
	var inst = ds_map_find_value(npc_dialog_map, key);
	if (!is_undefined(inst)){
		if(check[0] != -1){
			other.current_dialog = inst; 	
		}
	}
}