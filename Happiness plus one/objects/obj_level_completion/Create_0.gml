
guiWidth					= display_get_gui_width();
guiHeight					= display_get_gui_height();

//values that will need to be passed into the object
			
npc_id						= noone;
npc_spr						= noone;
player_spr					= noone; 
next_room					= noone; 

start_obj_playerx			= obj_player.x;
start_obj_playery			= obj_player.y;



timer						= 0;
white_light_time			= 3; 
white_screen_time			= 5; 
room_transition_buffer		= 3; 
cameraPan					= 0.02;
cameraPanAmount				= 0; 
totalCameraPan				= 1.5;
raisespeed					= 1.5; 
raiseoffset					= 0.8;
message_time				= 3; 

message						="Happiness Plus 1"
message_x					= guiWidth/2;
message_y					= guiHeight/2; 


x_offset = sprite_get_xoffset(spr_character_mask);
y_offset = sprite_get_yoffset(spr_character_mask); 

//can be any color 
fade_color					= c_white;

xscale	= 1; 
yscale	= 1;
color	= c_white;

// speed
fade_speed_light			= 0.01; 
fade_speed					= 0.01; 
current_phase				= 0; 
fade_alpha_player			= 1; 



