
guiWidth					= display_get_gui_width();
guiHeight					= display_get_gui_height();


// fade in = 0
// fade out = 1
fade_in_or_out				= 0; 
fade_alpha					= 1;

//values that will need to be passed into the object
							///for testing this will be set to obj_ash
npc_id						= noone;
base						= -1;
new_base					= -1; 
new_npc_id					= noone; 

scale_amount				= 0.01
max_scale_amount			= 40; 
image_flux_scale			= 2; 
timer						= 0;
image_flux_time				= 3; 
white_screen_flux_time		= 4; 
after_transition_buffer		= 5; 
image_flux_buffer			= 0.5; 

yoffset						= 0; 
yoffset	-= scale_amount*(64/2); 
xoffset						=-1;
xoffsetAmount				=10; 
xoffsetbuffer				=500; 

x_offset = sprite_get_xoffset(spr_character_mask);
y_offset = sprite_get_yoffset(spr_character_mask); 

//can be any color 
fade_color					= c_white;

xscale	= 1; 
yscale	= 1;
color	= c_white;

// speed
fade_speed					= 0.01; 
current_phase				= 0; 
enum transition{
	phase1, 
	phase2, 
	phase3,
	phase4, 
	phase5,
	phase6,
	phase7,
}


