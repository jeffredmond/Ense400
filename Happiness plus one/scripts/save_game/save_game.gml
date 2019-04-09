///@description saves current game 

//some issues have been poppin up so they might dissapear if i get rid of the save file each time
//
if(file_exists("savefile1.sav")){
	file_delete("savefile1.sav"); 	
}


var root_list = ds_list_create(); 

	var map0 = ds_map_create();
	ds_list_add(root_list, map0)
	ds_list_mark_as_map(root_list, ds_list_size(root_list)-1);
	
	var obj0 = "player_name"; 
	ds_map_add(map0, "obj", obj0); 
	ds_map_add(map0, "save_name", global.player_name); 
	

//retrieve the player x and y information and current room
with(obj_player){
	var map2 = ds_map_create();
	ds_list_add(root_list, map2); 
	ds_list_mark_as_map(root_list, ds_list_size(root_list) -1); 
	
	var obj2 = object_get_name(object_index);

	var cur_room_name = room_get_name(room); 
	ds_map_add(map2, "room_name", cur_room_name);
	ds_map_add(map2, "obj", obj2); 
	ds_map_add(map2, "x", x);
	ds_map_add(map2,"y", y);

}

with(obj_inventory) {
	var map1 = ds_map_create();
	ds_list_add(root_list, map1);
	ds_list_mark_as_map(root_list, ds_list_size(root_list) -1); 
	
	var obj1 = object_get_name(object_index);
	ds_map_add(map1, "obj", obj1);
	
	
	var xx = 0; 
	repeat(inv_slots){
		ds_map_add(map1, "item" + string(xx), ds_inventory[# 0, xx])
		xx++; 
	}
}

//retrieve the flags any that are not global 
with(game) {
	var map3 = ds_map_create(); 
	ds_list_add(root_list, map3); 
	ds_list_mark_as_map(root_list, ds_list_size(root_list) -1); 
	
	var obj3 = object_get_name(object_index); 
	ds_map_add(map3, "obj", obj3); 
	ds_map_add(map3, "flag1", puzzle_one_solved); 
	ds_map_add(map3, "total_time", total_time);
	ds_map_add(map3, "player_progress", player_image_index);	
}

//retrieve what items in the map have been picked up
with(obj_item_interaction) {
	var map4 = ds_map_create(); 
	ds_list_add(root_list, map4); 
	ds_list_mark_as_map(root_list, ds_list_size(root_list) -1); 
	
	var obj4 = object_get_name(object_index); 
	ds_map_add(map4, "obj", obj4); 
	ds_map_add(map4, "has_been_picked_up", has_been_picked_up); 
	ds_map_add(map4, "sprite_indx", sprite_indx);
	ds_map_add(map4, "instance_id", id); 
}

//retrieve what the current dialogs are
with(obj_parent_npc) {
	var map5 = ds_map_create(); 
	ds_list_add(root_list, map5); 
	ds_list_mark_as_map(root_list, ds_list_size(root_list) -1); 
	
	var obj5 = object_get_name(object_index); 
	ds_map_add(map5, "obj", obj5); 
	ds_map_add(map5, "current_dialog", current_dialog); 
}



// wrap the root list into a map

var wrap = ds_map_create(); 
ds_map_add_list(wrap, "ROOT", root_list); 


// save all this to a string
var str = json_encode(wrap); 
var save_filename = "savefile1.sav";

//use a buffer to save the string 
var _buffer = buffer_create(string_byte_length(str)+1, buffer_fixed, 1);
buffer_write( _buffer, buffer_string, str);
buffer_save (_buffer, save_filename);
buffer_delete(_buffer); 

// get rid of the data
ds_map_destroy(wrap); 

//play a jingle if the game saves properly
audio_play_sound(snd_saved_game, 1, false); 

show_debug_message("game saved"); 


