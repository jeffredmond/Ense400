

//handle the fade and room transition
if(fade_in_or_out == 0){
	fade_alpha += fade_speed;
	if(fade_alpha >= 1){
		instance_destroy();
		exit;
		}
} else {
	fade_alpha -= fade_speed;
	if(fade_alpha <= 0){
		instance_destroy();
		exit; 
		}
}

draw_set_alpha(fade_alpha);
draw_rectangle_color(0,0, guiWidth, guiHeight, fade_color, fade_color, fade_color, fade_color, false); 
draw_set_alpha(1); 
