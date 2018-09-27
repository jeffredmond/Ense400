#region // get player inputs 

if(hascontrol)
	{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A")); 
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space); 

	// calulate movement 
	var move = key_right - key_left; 
	hsp = move * walksp; 
	vsp = vsp + grv;

	//jumping

	if(place_meeting(x, y+1, obj_wall) && (key_jump)) 
	{
		audio_play_sound(sndJump,7,false); 
		vsp = -7; 
	}

	// horizontal collision detection 
	if(place_meeting(x+hsp, y, obj_wall)) 
	{
		while(!place_meeting(x+sign(hsp), y, obj_wall))
		{
			x = x + sign(hsp); 
		}
		hsp = 0; 
	}
	x = x + hsp; 
}
else
{
	key_jump = 0;
	key_left = 0;
	key_right = 0; 
}

#endregion

// vertical collision detection 

if(place_meeting(x, y+vsp, obj_wall)) 
{
	while(!place_meeting(x, y+sign(vsp), obj_wall))
	{
		y = y + sign(vsp); 
	}
	vsp = 0; 
}

y = y + vsp; 
// animation
if(!place_meeting(x, y+1, obj_wall))
{
	sprite_index = spr_airborn; 
	image_speed = 0;  
	if(sign(vsp) > 0) image_index = 1 else image_index = 0; 
}

else 
{
	if(sprite_index == spr_airborn) audio_play_sound(sndLanding,15,false); 
	image_speed = 1; 
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_running;
	}
}

if(hsp != 0) image_xscale = sign(hsp); 



