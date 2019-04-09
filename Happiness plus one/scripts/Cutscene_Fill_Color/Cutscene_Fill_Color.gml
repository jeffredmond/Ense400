///@description Cutscene_Fade
///@arg color


if(!instance_exists(obj_fill_screen)){
	var inst = instance_create_layer(0, 0, "Instances", obj_fill_screen);
	with(inst){
		color = argument0; 
		event_perform(ev_other, ev_user0); 
	}
}
	Cutscene_End_Action(); 

