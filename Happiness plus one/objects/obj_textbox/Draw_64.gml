
if(is_string(text[page])){ 
	//draw box
	draw_sprite(box, 0, box_x, box_y); 
		
	// draw portrait back
	draw_sprite(frame, 0, portrait_x, portrait_y); 

	// draw portrait
	draw_sprite(portrait, portrait_index, portrait_x, portrait_y);

	// draw portrait frame
	draw_sprite(frame, 1, portrait_x, portrait_y); 

	// draw the name and the text. 
	draw_set_font(font);

	c = name_text_col; 
	draw_text_color(name_x, name_y, name, c,c,c,c, 1); 
	c = text_col; 

	if(!pause && letters < str_len){
		letters += text_speed;
		if(letters mod 2 == 0){
			audio_play_sound(voice, 10, false); 
		}
	
		switch(string_char_at(wrapped_text, letters)){
			case ",": pause = true; alarm[1] = 15; break;
			case ".":  
			case "?": 
			case "!": pause = true; alarm[1] = 25; break;
			case "|": 
				Increment_NPC_Dialog(spkr);
				instance_destroy();  
				break;
		
		}
	}
	var text_current = string_copy(wrapped_text, 1, floor(letters));
	draw_text_color(text_x + name_width, text_y, text_current, c,c,c,c, 1); 
}else 
{
	current_command = text[page]; 
	var len = array_length_1d(current_command) - 1; 

	current_command_array = -1; 
	current_command_array = array_create(len,0);
	array_copy(current_command_array, 0, current_command, 1, len); 
	
	script_execute_alt(current_command[0], current_command_array); 
}




