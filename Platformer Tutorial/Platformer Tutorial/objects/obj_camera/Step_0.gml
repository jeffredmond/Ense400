//update destination

if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25; 



//keep camera center inside room
x = clamp(x, view_w_half+buff, room_width - view_w_half-buff); 
y = clamp(y, view_h_half+buff, room_height - view_h_half+buff); 

//screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max (0, shake_remain - ((1/shake_lenght) * shake_magnitude))

// update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half); 

//parallax backgrounds for mountians 
if(layer_exists(mountian_layer)){
	layer_x(mountian_layer, x/2); 	
}

// parallax backround for the trees 
if(layer_exists(trees_layer)) layer_x(trees_layer, x/4);

