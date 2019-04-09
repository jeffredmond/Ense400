
global.hasControl = false; 

// camera and display variables 
view_width	= camera_get_view_width(view_camera[0]);	
view_height	= camera_get_view_height(view_camera[0]);

//key inputs
interact_key	= ord("Z"); 
key_left		= vk_left;
key_right		= vk_right;
key_enter		= interact_key; 

//button variables 
cur_selected	= 0; 
NO				= 0;
YES				= 1; 
numbtn			= 2; 


buttons = ds_list_create();
buttons[| 0]		= "NO";
buttons[| 1]		= "YES"; 


//formatting variables for the text box 
box				= spr_textbox; 

box_width		= sprite_get_width(box);
box_height		= sprite_get_height(box);


box_x			= (camera_get_view_width(view_camera[0]) - box_width) * 0.5;
box_y			= (camera_get_view_height(view_camera[0]) * 0.98) - box_height;

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

//states that the interaction textbox is currently in 
interacting			= false; 
pause				= false; 
item_in_inventory	= false;
item_acquired		= false; 
done_interacting	= false; 
picked_up			= false; 
InvIsFull			= false; 
text[0]				="hello there";
page				= 0; 
needed_item			= item.none; 
resulting_item		= item.none; 


// this will be the text that will be displayed dending on the situation (needed_item == what, and so on )

response_default_success	= "You picked up a: ";
response_inv_full			= "Your inventory is currently full";
response_reqitem_fail		= "You are missing the necessary items to do anything right now";
response_reqitem_success1	= "You used a ";
response_reqitem_success2	= " from your inventory with this to get a "
response_master				= ""



//voice			= snd_voice2; 
