///@description check flag, if true increment counter if false exit
///@arg flag 
///@arg object

var inst = argument0; 

with(inst){
	var flag = asset_get_index(argument1);
	if(!flag) instance_destroy(); 
	else TextBox_End_Action(); 
}
