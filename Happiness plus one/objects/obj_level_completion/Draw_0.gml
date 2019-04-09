

var cell_size			= 64; 
x_frame					= 0; 
y_frame					= 0; 
global.hasControl			= false; 

//handle the fade and room transition
switch(current_phase) {
	//play a sound, the have the spotlight turn on start the happy tune
	case transition.phase1: 
		cameraPanAmount	+= cameraPan
		with(obj_camera){
			follow.y -= other.cameraPanAmount;	
		}
		if(cameraPanAmount >= totalCameraPan){
			current_phase++;
			fade_alpha = 0; 
		}
	break;
	
	case transition.phase2: 
		timer++; 
		fade_alpha += fade_speed_light; 
		if(timer >= (white_light_time * room_speed) ){
			timer = 0;
			current_phase++; 
		}		
	break;
	
	break;
	// the two characters raise up into the light
	case transition.phase3: 
		yy -= raisespeed;
		if(yy <= raiseoffset*start_obj_playery){jj-= raisespeed}; 
		if(jj <= 0.9*start_obj_playery){
			current_phase++;
			fade_alpha = 0;
		} 
		
	break;
	
	case transition.phase4: 
		/// display the happiness plus one message
		timer++; 
		fade_alpha += fade_speed_light; 
		draw_set_font(font_happiness_plus_one); 
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		
		if(timer >= (message_time * room_speed) ){
			timer = 0;
			current_phase++; 
			fade_alpha = 0;
		}			
	break;
	
	//halfway through the rising make the screen fade to either black or white
	case transition.phase5: 
		jj -= raisespeed;
		timer++; 
		fade_alpha += fade_speed_light; 
		if(timer >= (white_screen_time * room_speed) ){
			timer = 0;
			current_phase++; 
		}		
	break;
	//trasfer to the next room
	case transition.phase6: 
		if(room != next_room)room_goto(next_room); 
		timer++; 
		//draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		if(timer>= room_transition_buffer * room_speed){
			timer = 0;
			fade_alpha = 1; 
			current_phase++; 
		} else {
			exit; 	
		}
	break;
	//fadebackin
	case transition.phase7: 
		fade_alpha -= fade_speed; 
		if(fade_alpha <= 0){
			global.NPCTransforming  = false;
			global.hasControl		= true; 
			global.endLevelAnimation	= false; 
			with(obj_camera){
				follow = obj_player	
			}
			instance_destroy(); 
		}else {exit;}
	break;

}

//draw character base
draw_sprite_part_ext(npc_spr, 0,floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy, xscale, yscale,c_white,fade_alpha_player) 

// draw player sprite
draw_sprite_part_ext(player_spr, 0,floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, ii, jj, xscale, yscale,c_white,fade_alpha_player) 
