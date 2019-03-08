
//lighting effects variables 

delay				= 100; 
lighting_curr		= 198; 
fade_amount			= 10; 

lighting[0]			= spr_Lighting1;
lighting[1]			= spr_Lighting2; 

light_cycle_done	= false; 
light_cycle_curr	= 0; 

li_x_buffer			= 0
li_y_buffer			= -32

li_xscale			= 1;
li_yscale			= 1;
li_x				= 0 + li_x_buffer;
li_y				= 0 + li_y_buffer;

// this is important for loading the save file names from memory 

// step one: get all the names of the save files: if they exist store them into the save screen 
	// check it out name = filename_name(file_find_first("C:\Games\*.doc", 0));
	// Windows has all files in the %localappdata%\<Game Name> directory 
	// (on Windows 7 this is the /Users/<User Name>/AppData/Local/<Game Name> directory).
	
// step 2 
	// if a person decides to load a saved game then the name of the save file will be 
	// passed to the save script. 
	
// 




//options constants 


global.view_width	= camera_get_view_width(view_camera[0]);	
global.view_height	= camera_get_view_height(view_camera[0]);

global.key_enter	= vk_enter;
global.key_up		= vk_up;
global.key_down		= vk_down; 
global.key_backspace= vk_backspace; 

draw_set_font(font_titleScreen_options);

enum title_screen {
	play,
	load,
	credits,
	quit
}

enum title_element_type {
	script_runner,
	page_transfer,
	title_room_transfer
}

//create the menu page 

ds_title_screen		= CreateMenuPage(
	["Play",			title_element_type.title_room_transfer,			room_transfer,			rm_create_character],
	["Load",			title_element_type.title_room_transfer,			room_transfer,			rm_loading],
	["Credits",			title_element_type.title_room_transfer,			room_transfer,			rm_credits],
	["Quit",			title_element_type.script_runner,				exit_game]
);

page = 0;
titleScreen_pages = [ds_title_screen]


var i = 0, array_len = array_length_1d(titleScreen_pages);
repeat(array_len){
	titleScreen_option[i] = 0;
	i++;
}

inputting = false; 

