///@description Pan camera to another location at a set speed
///@arg end_x
///@arg end_y
///@arg cutspeed 

with(obj_camera) {
	follow.x		= argument[0];
	follow.y		= argument[1];
	var cutspeed	= argument[2];
}

