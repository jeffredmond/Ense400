/// @description Insert description here
// You can write your code in this editor

#region

if(hasControl)
{
	
	part_emitter_region(global.P_System, global.Emitter1, x-20, x+20 , y , y+20 , ps_shape_rectangle, ps_distr_invgaussian);
	image_speed=0;
	
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	//calculate movement
	var moveLR = key_right - key_left;
	var moveUD = key_down - key_up;
	hsp = moveLR * walksp;
	vsp = moveUD * walksp;
	
	// horizontal collision detection
	if(place_meeting(x+hsp, y, obj_wall) || place_meeting(x+hsp, y, obj_items_level1) || place_meeting(x+hsp, y, obj_sign))
	{
		while(!(place_meeting(x+sign(hsp),y, obj_wall)) ^^ !(place_meeting(x+sign(hsp), y, obj_items_level1)) ^^ !(place_meeting(x+sign(hsp), y, obj_sign)))
		{
			x = x + sign(hsp); 
		}
		hsp = 0;
	}
	x = x + hsp; 
	
	// vertical collison detection
	
	if(place_meeting(x, y+vsp, obj_wall) || place_meeting(x, y+vsp, obj_items_level1) || place_meeting(x, y+vsp, obj_sign))
	{
		while(!place_meeting(x, y+sign(vsp), obj_wall) ^^ !place_meeting(x, y+sign(vsp), obj_items_level1) ^^ !place_meeting(x, y+sign(vsp), obj_sign))
		{
			y = y + sign(vsp);
		}
		vsp = 0; 	
	}
	
	y = y + vsp;
	}
	
	
	
else
{
	key_up = 0;
	key_down = 0;
	key_left = 0;
	key_right = 0;
}



#endregion


// animation of objects

if(hsp!= 0) image_xscale = sign(hsp); 
	