///@description Cutscene_Fade
///@arg in_or_out
///@arg fade_color
///@arg fade_speed 

if(!instance_exists(obj_fade)){
	var inst = instance_create_layer(0, 0, "Instances", obj_fade);
	with(inst){
		finout = argument0;
		color = argument1; 
		spd = argument2; 
	
		event_perform(ev_other, ev_user0); 
	}
}
	Cutscene_End_Action(); 

