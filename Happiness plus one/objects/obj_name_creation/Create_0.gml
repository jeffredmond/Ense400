///@description create event for the obj_name_creation

//the player name
	
	global.player_name = "TEST TEST TEST"

// camera and display variables 
view_width	= camera_get_view_width(view_camera[0]);	
view_height	= camera_get_view_height(view_camera[0]);

display_set_gui_size(view_width, view_height); 
draw_set_font(font_CS_title);

//formatting variables 
keyboard_x_buffer = 64; 
keyboard_y_buffer = 0; 

slots_x			= 65; 
slots_y			= 65; 


//key inputs 
key_enter		= vk_enter;
key_left		= vk_left;
key_right		= vk_right;
key_up			= vk_up;
key_down		= vk_down; 
key_backspace	= vk_backspace; 


//keyboard variables 
keyboard_width  = 8;
keyboard_height = 4;
str_lwr			= 97;
end_lwr			= 122;
str_uppr		= 65;
end_uppr		= 90;
ascii_spc		= 32;

cur_selected	= 24; 
ds_key_size		= keyboard_height * keyboard_width; 
total_keys		= 32; 

uppr_lwr		= 26; 
AccName			= 27; 
Back			= 28; 


////////////////////////////////////////////////////////////////////////////
// init the lower and upper case grids that will be printed to screen/////// 



	ds_grid_lwr_keys = ds_grid_create(keyboard_width, keyboard_height); 
	ds_grid_uppr_keys = ds_grid_create(keyboard_width, keyboard_height); 

	var currChar = str_lwr; 
	for(var i = 0; i < keyboard_height; i++){
		for(var j = 0; j < keyboard_width; j++){			
			if(currChar > end_lwr || currChar < str_lwr) currChar = ascii_spc; 
			ds_grid_lwr_keys[# j, i] = currChar;
			currChar++;
		}
	}

	var currChar = str_uppr; 
	for(var i = 0; i < keyboard_height; i++){
		for(var j = 0; j < keyboard_width; j++){
			if(currChar > end_uppr || currChar < str_uppr) currChar = ascii_spc; 
			ds_grid_uppr_keys[# j, i] = currChar;
			currChar++;
		}
	}

	// load in the special values (ie Back, lwr, uppr, Accept Name 
	ds_grid_lwr_keys[# 2, 3]	= "Uppr"; 
	ds_grid_uppr_keys[# 2, 3]	= "Lwr";
	ds_grid_lwr_keys[# 3, 3]	= "Accept Name"; 
	ds_grid_uppr_keys[# 3, 3]	= "Accept Name"; 
	ds_grid_lwr_keys[# 4, 3]	= "Back"; 
	ds_grid_uppr_keys[# 4, 3]	= "Back";  

//load the grids into an array for easy transfer between the two 

	currkeyboard		= 0; 
	array_keyboards[0]	= ds_grid_lwr_keys; 
	array_keyboards[1]	= ds_grid_uppr_keys; 


