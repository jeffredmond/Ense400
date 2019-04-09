///@description LightEffects_Script
///@arg sprite

var spr = argument0;
var fadein = (1 - (delay - lighting_curr )/delay);
var fadeout = (((delay*2) - lighting_curr )/(delay*2)); 

gpu_set_blendmode(bm_add);	

if(lighting_curr < delay) {

	draw_sprite_ext(spr, -1, 0, 0, 1, 1, 0, -1, fadein); 	
	lighting_curr++; 

}

else if(lighting_curr < (delay * 2) && lighting_curr >= delay) {
	draw_sprite_ext(spr, -1, 0, 0, 1, 1, 0, -1, fadeout);		
	lighting_curr++; 
} else if (lighting_curr == delay * 2){
	lighting_curr = 0; 
	gpu_set_blendmode(bm_normal);	
	return true; 
} 

gpu_set_blendmode(bm_normal);	
return false; 

