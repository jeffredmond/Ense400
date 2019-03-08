/// @description trying out different interact keys

if (point_in_circle(obj_player.x, obj_player.y, x, y, 20)) && (!instance_exists(obj_text))
{
	with (instance_create_layer(x,y-64,layer,obj_text))
	{
		text = other.text; 
		length = string_length(text);
	}
	
	with (obj_camera)
	{
		follow = other.id; 	
	}
}