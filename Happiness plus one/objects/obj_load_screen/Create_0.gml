///@description create event for the obj_name_creation


// camera and display variables 
view_width	= camera_get_view_width(view_camera[0]);	
view_height	= camera_get_view_height(view_camera[0]);

display_set_gui_size(view_width, view_height); 
draw_set_font(font_CS_title);

//formatting variables 

savefile_x_buffer = 64; 
savefile_y_buffer = 0; 

slots_x			= 65; 
slots_y			= 65; 


//key inputs 
key_enter		= vk_enter;
key_left		= vk_left;
key_right		= vk_right;

//savefile information 
name			= " "
image			= 1; 	
total_time		= 0; 

with(game){ 
	other.name			= player_name;
	other.image			= player_image_index;
	other.total_time	= total_time; 
	}

if(total_time != 0){
total_time_sec		= (total_time mod 60)
total_time_min		= (total_time div 60) 
total_time_ms		= string(total_time_min) + "m " + string(total_time_sec) + "s"
}

image_sprite_name	= spr_load_playerprog; 
image_x_position	= image mod 4; 
image_y_position	= image div 4;
image_cell_size		= 64; 

yimage_position_scale = 16; 

time_image_buffer_y = 16; 

//button variables 
cur_selected	= 0; 
Back			= 0;
AccName			= 1; 
numbtn			= 2; 

buttons = ds_list_create();
buttons[| 0]		= "Back";
buttons[| 1]		= "Accept"; 

