
var gwidth = view_width, gheight = view_height; 

//draw box
draw_sprite(box, 0, box_x, box_y); 
draw_sprite(box, 1, box_x, box_y); 
	
	
if (!interacting ){	
	// draw the text. 
	draw_set_font(font);
	draw_set_halign(fa_left)
	c = text_col; 

	if(!pause && letters < str_len){
		letters += text_speed;
	/*	
		if(letters mod 2 == 0){
			audio_play_sound(voice, 10, false); 
		}
	*/	
		switch(string_char_at(wrapped_text, letters)){
			case ",": pause = true; alarm[1] = 15; break;
			case ".":  
			case "?": 
			case "!": pause = true; alarm[1] = 25; break;	
			case "#": 
		
		
			break; 
		}
	}
	var text_current = string_copy(wrapped_text, 1, floor(letters));

	draw_text_color(text_x , text_y, text_current, c,c,c,c, 1); 

} else if (interacting){
	
	//draw the interact prompt 
	draw_set_halign(fa_left)
	var prompt = "Interact?"
	c = c_white; 
	draw_text_color(text_x, text_y, prompt, c, c, c, c, 1);
	
	//draw the yes and no options
	var list = buttons; 
	
	var curbutn = 0; 
	var butn_buffer_x = 64; 
	
	var butn_start_x = gwidth/2 - butn_buffer_x; 
	var butny = box_y; 
	var butty_buffer = box_height/2
	
	repeat (numbtn){
		
		// x, y location for each button 
		draw_set_halign(fa_center); 
		
		var butn_str = list[| curbutn]; 
		var xx = butn_start_x + butn_buffer_x * curbutn * 2; 
		var yy = butny + butty_buffer; 
		c = c_white; 
		
		if(curbutn == cur_selected) {
			c = c_red; 
			draw_text_color(xx, yy, butn_str, c, c, c, c, 1);
		}
		else{
		draw_text_color(xx, yy, butn_str, c, c, c, c, 1); 
		}	
		curbutn++; 
	}		
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




