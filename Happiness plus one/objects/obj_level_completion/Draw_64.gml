/// @description Insert description here
// You can write your code in this editor

//handle the fade and room transition
var cell_size			= 64; 
switch(current_phase) {
	case transition.phase2: 
		draw_sprite_ext(spr_transformation_lighting,0, 0, 0, 1, 1, 0, c_white, fade_alpha); 
	break;
	case transition.phase3: 
		draw_sprite_ext(spr_transformation_lighting,0, 0, 0, 1, 1, 0, c_white, 1);  
	break;
	case transition.phase4: 
		draw_sprite_ext(spr_transformation_lighting,0, 0, 0, 1, 1, 0, c_white, 1); 
		draw_text(message_x, message_y, message); 
	break;
	case transition.phase5: 
		draw_sprite_ext(spr_transformation_lighting,0, 0, 0, 1, 1, 0, c_white, 1);
		draw_text(message_x, message_y, message); 
		draw_set_alpha(fade_alpha);
		draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		draw_set_alpha(1); 
	break;
	case transition.phase6:   
		draw_set_alpha(1); 
		draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		draw_set_alpha(1); 
	break;
	case transition.phase7:   
		draw_set_alpha(fade_alpha); 
		draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		draw_set_alpha(1); 
	break;
	
}
