
// this is where i can do the typewritter style text display as well as the sound effects
// for where each letter is drawn 

if(keyboard_check_pressed(interact_key)&& is_string(text[page])){
	if(letters < str_len){letters = str_len; } 
	else if(page < array_length_1d(text) -1){
		page++;	
		event_perform(ev_other, ev_user1); 
	} else { instance_destroy();}
}

