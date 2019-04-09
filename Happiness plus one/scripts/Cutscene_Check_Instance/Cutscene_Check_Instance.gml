///@description Cutscene_Check_Instacne
///@arg instance 
var inst = argument0; 

if(instance_exists(inst)){
	Cutscene_End_Action();
} else {
	instance_destroy();	
}



