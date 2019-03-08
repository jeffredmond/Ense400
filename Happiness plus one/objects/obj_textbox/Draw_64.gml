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
	}
}
var text_current = string_copy(wrapped_text, 1, floor(letters));

draw_text_color(text_x + name_width, text_y, text_current, c,c,c,c, 1); 






	// i dont think that i will need this in my game: maybe have this featured 
	// directly underneath the players face. 
	
	// should i maybe have an animation of the charcters talking? to do this i would need
	// to have some way to keep track of what frame for each charcter looks like
	// then have all the faces in one section of frames
	
	// frame 1,		frame 2,	frame, 3,	frame4,		frame5, 
	// happy		surprised	sad			talk0		talk1
	
	// could store information like this and then use an enum to assign names to each frame
	// 

// ////////////// draw text


// draw name


// draw text


