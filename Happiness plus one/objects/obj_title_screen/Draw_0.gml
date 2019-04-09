

//// testing for the drawing lighting effects stuff 
var spr = lighting[light_cycle_curr]
var fadein = (1 - (delay - lighting_curr )/delay);
var fadeout = (((delay) - (lighting_curr-delay) )/(delay)); 


if(lighting_curr < delay) {
	gpu_set_blendmode(bm_add);	
	draw_sprite_ext(spr, -1, li_x, li_y, li_xscale, li_yscale, 0, -1, fadein/fade_amount); 	
	light_cycle_done = false; 
	gpu_set_blendmode(bm_normal);	
}

else if(lighting_curr < (delay * 2) && lighting_curr >= delay) {
	gpu_set_blendmode(bm_add);		
	draw_sprite_ext(spr, -1, li_x, li_y, li_xscale, li_yscale, 0, -1, fadeout/fade_amount);	
	gpu_set_blendmode(bm_normal);	
} 

else if (lighting_curr == delay * 2){
	lighting_curr = 0; 
	light_cycle_done = true; 
} 


