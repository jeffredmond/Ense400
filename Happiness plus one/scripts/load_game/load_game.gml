///@description loads a existing game 

if(file_exists("savefile1.sav")){
	var _buffer = buffer_load("savefile1.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _json = json_decode(_string); 
	var wrapper = _json; 	
	var _list = wrapper[? "ROOT"]; 
	
	for(var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = _list[| i];
		var _obj = _map[? "obj"]; 
		if (_obj != "player_name"){
			var curr_obj = asset_get_index(_obj); 
			if(object_get_parent(curr_obj) == obj_parent_npc){
				var workaroundnpc = _obj; 
				curr_obj	=	object_get_parent(curr_obj); 
			}
		}else{
			var curr_obj = _obj; 
		}

			switch(curr_obj){
			case("player_name"):
				global.player_name = _map[? "save_name"];
			break;
			case(obj_inventory):
				
				if(instance_exists(obj_inventory)){
					with(obj_inventory){
						var xx = 0; 
						repeat(inv_slots){
							ds_inventory[# 0, xx] = _map[? "item" + string(xx)]
							xx++; 
						}
					}
				} else {
					var xx = 0;
					/// in the future if i want to have a scalable inventory this will need to change 
					repeat (9){
						ds_map_add(game.inventory_buffer, ("item" + string(xx)), _map[? "item" + string(xx)]);
						xx++; 
					}
					
				}
			break;
			case(obj_player):
				var curr_room = _map[? "room_name"]; 
					var rm = asset_get_index(curr_room);
					if(rm != room) 
					{
						room_goto(rm);
						game.playerx = _map[? "x"];
						game.playery = _map[? "y"]; 
					}else{
						room_restart(); 
						game.playerx = _map[? "x"];
						game.playery = _map[? "y"]; 						
					}
					if(instance_exists( obj_player) && rm == room){ 
						with(obj_player){
							x = _map[? "x"];
							y = _map[? "y"]; 
						}
					} else if (!instance_exists(obj_player)) {
						game.playerX_title_screen = _map[? "x"];
						game.playerY_title_screen = _map[? "y"]; 
						game.loading_from_title	= true; 
					}
			break;
			case(game):
				with(game){
					puzzle_one_solved = _map[? "flag1"]; 
				}				
			break; 
			
			case(obj_item_interaction):
				if(instance_exists(obj_item_interaction)){
					with(_map[? "instance_id"]){
						has_been_picked_up	= _map[? "has_been_picked_up"]; 	
						sprite_indx			= _map[? "sprite_indx"]; 
					}
				} else {
					with(game){	
					var map4 = ds_map_create(); 
					ds_list_add(item_interaction_list, map4); 
					ds_list_mark_as_map(item_interaction_list, ds_list_size(item_interaction_list) -1); 
	
					ds_map_add(map4, "has_been_picked_up", _map[? "has_been_picked_up"]); 
					ds_map_add(map4, "sprite_indx", _map[? "sprite_indx"]);
					ds_map_add(map4, "instance_id", _map[? "instance_id"]); 
					}		
				}
			break;
			
			case(obj_parent_npc):
				if(instance_exists(obj_parent_npc)){
					with(curr_obj){
						current_dialog = _map[? "current_dialog"]; 	
					}
				} else {
					with(game){
					var npc_name = workaroundnpc; 
					var curr_dialog	= _map[? "current_dialog"]; 	
					ds_map_add(npc_dialog_map, npc_name, curr_dialog)
					}		
				}
			break; 
			}
	}
	
	ds_map_destroy(wrapper); 
	
}