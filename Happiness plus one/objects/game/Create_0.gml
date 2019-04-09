/// @description The game controller object

///////////////////////////////////////////
//global variables to be used in the game//

	//menu screen global variables  
global.hasControl			=  true;
global.full					= false; 
global.ingame				= false; 
global.pause				= false; 
global.showInventory		= false; 
global.NPCTransforming		= false; 
global.endLevelAnimation	= false;
//variables for fade after room transitions. 
guiWidth					= display_get_gui_width();
guiHeight					= display_get_gui_height();
blackAlpha					= 0; 
spawnRoom					= -1; 
doTransition				= false; 
spawnX						= 0; 
spawnY						= 0;
spawnPlayerFacing			= -1; 

enum dir {
	right	= 0,
	up		= 90, 
	left	= 180, 
	down	= 270
}

//need to keep track of the player x and y positions from when they are loaded from the save file
// and the player object has yet to be created. 

playerX_title_screen		= 0;
playerX_title_screen		= 0; 
//used to fix a bug that happens when loading from in game. 
playerx						= -1;
playery						= -1;  
loading_from_title			= false; 

// need to also keep track of npc dialog options and obj_item_interactions variables from when loaded from 
// title screen and have yet to be created. 
npc_dialog_map = ds_map_create();
item_interaction_list = ds_list_create(); 
inventory_buffer = ds_map_create(); 

// i dont know what this is for, to be returned to
fullscreen					= 4;

	//puzzle flags  
puzzle_one_solved			= false; 

// information to be loaded from the savefile and to be displayed on the load screen
player_name					= "<EMPTY>";
player_image_index			= 1; 
total_time					= 0; 
timer						= 0; 

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
		}else{
			var curr_obj = _obj; 
		}
			switch(curr_obj){
			case("player_name"):
				player_name = _map[? "save_name"];
			break;
		
			case(game):
				player_image_index	= _map[? "player_progress"];  
				total_time	= _map[? "total_time"];				
			break; 
			default:
			
			break;
			}
	}
	ds_map_destroy(wrapper); 
}
// initialize the audio for the game
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundEffects); 

room_goto_next(); 
