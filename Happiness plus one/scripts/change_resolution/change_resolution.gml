///@description change_resolution
///@arg value

//["384 x 216", "768 X 432", "1152 x 648", "1536 x 874", "1920 x 1080"]

	if(global.full) {change_window_mode(global.full)} 
switch(argument0){
	case 0: window_set_size(1024, 768); break;
	case 1: window_set_size(768, 432); break;
	case 2: window_set_size(1152, 648); break;
	case 3: window_set_size(1536, 874); break;
	case 4: window_set_size(1920, 1080); break;
}