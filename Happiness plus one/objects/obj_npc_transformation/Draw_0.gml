

var cell_size			= 64; 
var xx					= npc_id.x - x_offset*xscale;
var yy					= npc_id.y - y_offset*yscale; 
x_frame					= 0; 
y_frame					= 0; 
global.hasControl			= false; 

//handle the fade and room transition
switch(current_phase) {
	//the npc sprite will shrink down to nothing
	case transition.phase1: 
		fade_alpha -= fade_speed;
		if(xscale > 0){
		xscale -= scale_amount;
		yscale -= scale_amount;
		}
		if(fade_alpha <= 0)current_phase++; 
	break;
	//the npc sprite will be displayed as white and grow from nothing
	case transition.phase2: 
		shader_set(shd_White);
		yscale += scale_amount;
		xscale += scale_amount; 
		fade_alpha += fade_speed
		if(fade_alpha >= 1) current_phase++; 
	break;
	//the npc will pulsate for a few seconds 
	case transition.phase3: 
		//testing purposes
		current_phase++;
		scale_amount = 0.02; 
		exit; 
		/* this is a trasnsition phase put on the back burner for now 
		shader_set(shd_White);		
		timer++; 
		yscale = image_flux;
		xscale = image_flux; 
		if(timer >= (image_flux_time * room_speed) ){
			timer = 0;
			current_phase++; 
			scale_amount = 0.01; 
		}
		*/
	break;
	//the npc will grow and expand filling up the entire screen
	case transition.phase4: 
		shader_set(shd_White);
		yoffset	+= scale_amount*(cell_size/2); 
		yy += yoffset;
		xoffset	+= xoffsetAmount*scale_amount;
		if(xoffset <= xoffsetbuffer){
			xx -= xoffset;
		} else { xx -= xoffsetbuffer}
		yscale += scale_amount;
		xscale += scale_amount;
		scale_amount +=(scale_amount/50); 
		if(yscale >= max_scale_amount){
			current_phase++; 
		}
	break;
	//the screen will dislplay white for pre set amount of time
	case transition.phase5: 
		timer++; 
		//draw_rectangle_color(0,0, guiWidth, guiHeight, c_white, c_white, c_white, c_white, false); 
		if(timer>= white_screen_flux_time * room_speed){
			timer = 0;
			fade_alpha = 1; 
			current_phase++; 
			base = new_base; 
			yscale = 1;
			xscale = yscale;
		} else {
			exit; 	
		}
	break;
	//the screen will fade in from white then the transformation will end and 
	//controll will be given back to the player, also the camera will look at the 
	//player again
	case transition.phase6: 
		fade_alpha -= fade_speed; 
		draw_sprite_part(base, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy);
		if(fade_alpha <= 0){
			global.NPCTransforming  = false;
			global.hasControl		= true; 
			instance_create_layer(npc_id.x, npc_id.y, "Instances", new_npc_id);
			instance_destroy(npc_id); 
			instance_destroy();
			//current_phase++; 
			with(obj_camera){
				follow = obj_player	
			}
		}else {exit;}
	break;
	// this acts as a buffer phase using white_screen_flux time, the new npc object will display for a 
	// set amount of time before being distroyed, this gives some time for the code used for createing a new
	// instance to initiate.
	case transition.phase7:
	fade_alpha = 1; 
	timer++; 
	if(timer>= white_screen_flux_time * room_speed){
		instance_create_layer(x, y, "Instances", new_npc_id);
		instance_destroy(npc_id); 
		instance_destroy();
		exit; 
		} 
	break;	
}

//draw character base
draw_sprite_part_ext(base, 0,floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy, xscale, yscale,c_white,fade_alpha) 
shader_reset(); 