global.pause		= false;
global.view_width	= camera_get_view_width(view_camera[0]);	
global.view_height	= camera_get_view_height(view_camera[0]);


global.key_revert	= ord("X");
global.key_enter	= vk_enter;
global.key_left		= vk_left;
global.key_right	= vk_right;
global.key_up		= vk_up;
global.key_down		= vk_down; 
global.key_backspace= vk_backspace; 


display_set_gui_size(global.view_width, global.view_height); 
draw_set_font(font_sign);

enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//create the menu page 

ds_menu_main		= CreateMenuPage(
	["RESUME",			menu_element_type.script_runner,		resume_game],
	["SETTINGS",		menu_element_type.page_transfer,		menu_page.settings],
	["EXIT",			menu_element_type.script_runner,		exit_game]
);

ds_menu_settings	= CreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,		menu_page.audio],
	["GRAPHICS",		menu_element_type.page_transfer,		menu_page.graphics],
	["DIFFICULTY",		menu_element_type.page_transfer,		menu_page.difficulty],
	["BACK",			menu_element_type.page_transfer,		menu_page.main]
);

ds_menu_audio		= CreateMenuPage(
	["MASTER",			menu_element_type.slider,				change_volume,			1,		[0,1]],
	["SOUNDS",			menu_element_type.slider,				change_volume,			1,		[0,1]],		
	["MUSIC",			menu_element_type.slider,				change_volume,			1,		[0,1]],
	["BACK",			menu_element_type.page_transfer,		menu_page.settings]
); 

ds_menu_difficulty	= CreateMenuPage(
	["ENEMIES",			menu_element_type.shift,				change_difficulty,		0,		["SUPERCOMPUTER", "GAMING MASTER"]], 
	["ALLIES",			menu_element_type.shift,				change_difficulty,		0,		["NOT TOO CLEVER", "MEDIOCRE"]],
	["BACK",			menu_element_type.page_transfer,		menu_page.settings]
); 

ds_menu_graphics	= CreateMenuPage(
	["RESOLUTION",		menu_element_type.shift,				change_resolution,		0,		["1024 X 768", "768 X 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["WINDOW MODE",		menu_element_type.toggle,				change_window_mode,		1,		["FULLSCREEN", "WINDOWED"]],
	["BACK",			menu_element_type.page_transfer,		menu_page.settings]
);

page = 0;
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics]


var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false; 

// idealy you would want this in a controller object, but for testing purposes i will do this in the menu object
// i need to do this because i have create a new audio group in tools / audio groups 

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundEffects); 
