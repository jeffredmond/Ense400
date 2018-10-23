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

// update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
