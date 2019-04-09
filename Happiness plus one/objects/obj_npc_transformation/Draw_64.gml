/// @description Insert description here
// You can write your code in this editor

//handle the fade and room transition
var xx					= npc_id.x - x_offset*xscale;
var yy					= npc_id.y - y_offset*yscale; 
var cell_size			= 64; 
switch(current_phase) {
	case transition.phase5: 
		draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
	break;
	
	case transition.phase6:   
		draw_set_alpha(fade_alpha);
		draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		draw_set_alpha(1); 
	break;
	
}
