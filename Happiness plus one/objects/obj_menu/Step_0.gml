if(!global.pause) exit; 

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter); 

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

var ochange = input_down_p - input_up_p; 

if(inputting){
	switch(ds_grid[# 1, menu_option[page]]){
	case menu_element_type.slider:
		switch(menu_option[page]){
			case 0: if (!audio_is_playing(master_test)){ audio_play_sound(master_test, 1, false);} break; 
			case 1: if (!audio_is_playing(sound_test)){ audio_play_sound(sound_test, 1, false);} break;
			case 2: if (!audio_is_playing(music_test)){audio_play_sound(music_test, 1, false); }break;
		}
		var hinput = keyboard_check(global.key_right) - keyboard_check(global.key_left); 
		if(hinput != 0){
			ds_grid[# 3, menu_option[page]] += hinput * 0.01; 	
			ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1); 
			script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
		}
	
		break;
	
	case menu_element_type.toggle:
		var hinput = keyboard_check_pressed(global.key_right) - keyboard_check(global.key_left); 
		if(hinput != 0){
			//audio here
			ds_grid[# 3, menu_option[page]] += hinput; 	
			ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, 1); 
			
		}
		
		break;

	case menu_element_type.shift: 
		var hinput = keyboard_check_pressed(global.key_right) - keyboard_check(global.key_left); 
		if(hinput != 0){
			//audio here
			ds_grid[# 3, menu_option[page]] += hinput; 	
			ds_grid[# 3, menu_option[page]] = clamp( ds_grid[# 3, menu_option[page]] , 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1); 
			
		}
		
		break;
		
	case menu_element_type.input:
		inputting = !inputting;
		break; 
	}		
} else {
if(ochange != 0){
	menu_option[page] += ochange;
	if(menu_option[page] > ds_height -1){ menu_option[page] = 0;}
	if(menu_option[page] < 0) {menu_option[page] = ds_height - 1; }	
	}
}	
if(input_enter_p){
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.script_runner: 
		{
		var scr = ds_grid[# 2, menu_option[page]];	
		script_execute(scr); 
		if( scr == save_game || scr == load_game){
			global.hasControl = !global.hasControl; 
			global.pause = !global.pause; 
		}
			
		break;
		
		}
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break; 
		case menu_element_type.slider: 
		case menu_element_type.shift: 
		case menu_element_type.toggle: if(inputting) {script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); } 
			inputting = !inputting;
			break; 
	}
	//can put some audio here if you want, but why the heck would you do that 	
}