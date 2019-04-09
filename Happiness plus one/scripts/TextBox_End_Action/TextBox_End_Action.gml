///@description textbox end action

if(page < array_length_1d(text) -1){
		page++;	
		event_perform(ev_other, ev_user1); 
} else { instance_destroy();}