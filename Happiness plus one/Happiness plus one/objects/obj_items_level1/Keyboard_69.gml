/// @description item interaction E 

if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text))
{
		hasControl = false; 
	with (instance_create_layer(x,y-64,layer,obj_text))
	{
		text = other.text; 
		length = string_length(text);
	}
	
	with (obj_camera)
	{
		follow = other.id; 	
	}
	ds_list_add(inventory, current_item_name); 
	instance_destroy(); 
}
