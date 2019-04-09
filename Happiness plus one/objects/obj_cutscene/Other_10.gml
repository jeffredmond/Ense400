//this is just some code to clean up the other implementation that i had
//puts all the messy looking code into a function and this just formats the arguments
//into an array to be passed to the function to be executed. 
current_scene = scene_info[scene];
var len = array_length_1d(current_scene) - 1; 

current_scene_array = -1; 
current_scene_array = array_create(len,0);
array_copy(current_scene_array, 0, current_scene, 1, len); 
