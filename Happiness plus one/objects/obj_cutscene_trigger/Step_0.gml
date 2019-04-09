
if(!instance_exists(obj_cutscene)){
	if(place_meeting(x,y, obj_player)){
		Create_Cutscene(t_scene_info);
		instance_destroy(); 
	}
}