///@description check flag, if true increment counter if false exit
///@arg flag 
///@arg object

var inst = argument0; 
var flag = argument1;

with(inst){
	if(!flag) instance_destroy(); 
	else Cutscene_End_Action(); 
}
