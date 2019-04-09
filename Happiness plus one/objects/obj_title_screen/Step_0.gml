
// cycle through the lighting effects 

if(light_cycle_done == false){ lighting_curr++;}; 
if(light_cycle_done == true) { 
	light_cycle_curr++; 
	light_cycle_done = !light_cycle_done; 
	if(light_cycle_curr > 1) {light_cycle_curr = 0; }
}

// navigating through the main screen options


input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter); 
input_back      = keyboard_check_pressed(global.key_backspace); 

var ds_grid = titleScreen_pages[page], ds_height = ds_grid_height(ds_grid);

var ochange = input_down_p - input_up_p; 

if(ochange != 0){
	titleScreen_option[page] += ochange;
	if(titleScreen_option[page] > ds_height -1){ titleScreen_option[page] = 0;}
	if(titleScreen_option[page] < 0) {titleScreen_option[page] = ds_height - 1; }	
}
	
if(input_enter_p){
	switch(ds_grid[# 1, titleScreen_option[page]]){
		case title_element_type.script_runner: script_execute(ds_grid[# 2, titleScreen_option[page]]); break;
		case title_element_type.page_transfer: page = ds_grid[# 2, titleScreen_option[page]]; break; 
		case title_element_type.title_room_transfer: script_execute(ds_grid[# 2, titleScreen_option[page]], ds_grid[# 3, titleScreen_option[page]]); break;
			inputting = !inputting;
			break; 
	}
}	
if(input_back){
	room_goto_previous(); 	
}
	//can put some audio here maybe insert a sound when navigating through the options and then play a sound when the player pushes enter. 


