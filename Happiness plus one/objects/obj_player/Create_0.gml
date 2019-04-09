// set the constants for the player
event_inherited();

//this will set the player x and y positions from the save file when loading from the title screen
if(game.loading_from_title == true) {
	x = game.playerX_title_screen;
	y = game.playerY_title_screen; 
	game.loading_from_title = false; 
}


hsp		= 0;
vsp		= 0;
grv		= 0;
walksp	= 4;

x_frame = 1;
y_frame = 0; 

x_offset = sprite_get_xoffset(sprite_index);
y_offset = sprite_get_yoffset(sprite_index); 
/*
base	 = spr_base_m1;
eye		 = spr_eye_green;
hair	 = spr_hair1;
top		 = spr_top1;
pants	 = spr_pant1;
shoes	 = spr_shoe1; 

*/
base	 = spr_locked_base1;
eye		 = spr_eye_clear;
hair	 = spr_hair2;
top		 = spr_top_dark;
pants	 = spr_pant2;
shoes	 = spr_shoe2; 

facing	= 0; 


portrait_index  = 0;
voice			= snd_voice2;
name			= "player: "
text[0]			= ""

radius					= 30; 
active_textbox			= noone; 
active_description_box	= noone; 
active_interaction_box	= noone; 

//set ingame to be true
global.ingame = true; 

//particle effects
/*
global.P_System = part_system_create_layer(layer, 1);
global.Particle1 = part_type_create(); 

parxl_offset	= sprite_get_xoffset(sprite_index)/2; 
parxr_offset	= sprite_get_xoffset(sprite_index)/2; 
paryu_offset	= sprite_get_height(sprite_index)* 0.8; 
paryd_offset	= 0; 

part_type_blend(global.Particle1, true);
part_type_shape(global.Particle1, pt_shape_pixel);
part_type_size(global.Particle1, 0.1, 2, 0, 1); 
part_type_colour3(global.Particle1, $FFFF2600 & $FFFFFF, $FF00FFFF & $FFFFFF, $FF0000FF & $FFFFFF);
part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_speed(global.Particle1, 0, 0, 0, 0);
part_type_direction(global.Particle1, 0, 360, 0, 0); 
part_type_gravity(global.Particle1, 0.1, 90)
part_type_direction(global.Particle1, 0, 360, 0.5, 0);
part_type_life(global.Particle1, 40, 50);

global.Emitter1 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter1, x - 10, x + 10, y , y + 20, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(global.P_System, global.Emitter1, global.Particle1, 2); 

alarm_set(0, room_speed); 

*/