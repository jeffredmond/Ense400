
portrait		= spr_chr_portrait; 
frame			= spr_chr_frame;
box				= spr_textbox; 

timer			=0; 

portrait_width	= sprite_get_width(portrait);
portrait_height	= sprite_get_height(portrait);
frame_width		= sprite_get_width(frame);
frame_height	= sprite_get_height(frame);
box_width		= sprite_get_width(box);
box_height		= sprite_get_height(box);


portrait_x		= (camera_get_view_width(view_camera[0]) - box_width- portrait_width) * 0.5;
portrait_y		= (camera_get_view_height(view_camera[0]) * 0.98) - portrait_height;
box_x			= portrait_x + portrait_width;
box_y			= portrait_y;

name_x			= 0; // this will be <name> : dialog
name_y			= 0;

portrait_index	= 0; 
pause			= false; 


text[0]			="hello there";

page			= 0; 
name			=" "; 
voice			= snd_voice2; 

interact_key	= ord("Z"); 

name_width		=string_width(name); 

x_buffer		= 10; 
y_buffer		= 10; 

text_x			= box_x + x_buffer ;
text_y			= box_y + y_buffer
name_x			= box_x + x_buffer;
name_y			= text_y; 
text_max_width	= box_width - (4*x_buffer) - name_width; 

text_col		= c_white; 
name_text_col	= c_white;
font			= font_sign; 

draw_set_font(font);
text_height		= string_height("M"); 

text_speed		= 1;
letters			= 0;

