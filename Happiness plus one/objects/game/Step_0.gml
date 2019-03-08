//this object is resposnsible for setting global flags


//full screen command 
if(keyboard_check_pressed(vk_f1)){
	global.full = !global.full; 
	window_set_fullscreen(global.full);  
}


if(room == rm_Title_Screen) {
	exit;
}else { instance_destroy(obj_title_screen); }


//toggle pause screen 
if(keyboard_check_pressed(vk_escape)){
	global.pause = !global.pause; 
	global.hasControl = !global.hasControl; 

}

//toggle the inventory screen 
if(keyboard_check_pressed(ord("I"))){
	
	if(!instance_exists(obj_text)){
	global.showInventory = !global.showInventory; 
	global.hasControl = !global.hasControl; 
	}
}

if(instance_exists(obj_textbox)){
	
}

/// add in here the save mechanic 