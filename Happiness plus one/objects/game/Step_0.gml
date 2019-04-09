//this object is resposnsible for setting global flags

/// Timetracker section:   
//only if the game is not paused or not in the title screens will the time execute. 
if(!global.pause && global.ingame){
	timer++;
	if(timer%room_speed == 0) 
	{
		timer = 0; 
		total_time++;
	}
}

// this keeps things from breaking when a player enters a cutscene
if(instance_exists(obj_cutscene))exit; 
if(instance_exists(obj_cutscene ||obj_textbox || obj_textbox_item_description || obj_textbox_item_interaction)) exit; 
//full screen command 
if(keyboard_check_pressed(vk_f1)){
	global.full = !global.full; 
	window_set_fullscreen(global.full);  
}


if(room == rm_Title_Screen) {
	exit;
}else { 
	instance_destroy(obj_title_screen);
	}


//toggle pause screen 
if(keyboard_check_pressed(vk_escape)){
	if(global.showInventory){
		global.showInventory = false; 
		global.pause = true; 
	}
	else {
		global.pause = !global.pause; 
		global.hasControl = !global.hasControl; 
	}
}

//toggle the inventory screen 
if(keyboard_check_pressed(ord("I"))){
	if(!instance_exists(obj_textbox) || !instance_exists(obj_textbox_item_interaction) || !instance_exists(obj_textbox_item_description) ){
		if(!global.pause){
			global.showInventory = !global.showInventory; 
			global.hasControl = !global.hasControl; 
		}
	}
}




