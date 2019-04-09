
box				= spr_textbox; 

box_width		= sprite_get_width(box);
box_height		= sprite_get_height(box);


box_x			= (camera_get_view_width(view_camera[0]) - box_width) * 0.5;
box_y			= (camera_get_view_height(view_camera[0]) * 0.98) - box_height;

pause			= false; 

text[0]			="hello there";

page			= 0; 
voice			= snd_voice2; 

interact_key	= ord("Z"); 
 

x_buffer		= 10; 
y_buffer		= 10; 

text_x			= box_x + x_buffer ;
text_y			= box_y + y_buffer
name_x			= box_x + x_buffer;
name_y			= text_y; 
text_max_width	= box_width - (2*x_buffer); 

text_col		= c_white; 
name_text_col	= c_white;
font			= font_sign; 

draw_set_font(font);
text_height		= string_height("M"); 

text_speed		= 1;
letters			= 0;

global.hasControl = false; 
