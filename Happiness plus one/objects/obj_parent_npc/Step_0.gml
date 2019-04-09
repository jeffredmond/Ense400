/// @description Insert description here
// You can write your code in this editor

#region
if(!can_move) exit; 


key_left  =  0;
key_right =  0;
key_up    =  0;
key_down  =  0;
	
//calculate movement
moveLR = key_right - key_left;
moveUD = key_down - key_up;
hsp = moveLR * walksp;
vsp = moveUD * walksp;

// horizontal collision detection
if(hsp!= 0){
	if(place_meeting(x+hsp, y, obj_wall)){
		while(!place_meeting(x+sign(hsp),y, obj_wall)){
			x = x + sign(hsp); 
		}
		hsp = 0;
	}
	x = x + hsp; 
}
// vertical collison detection
	
if(vsp != 0){
	if(place_meeting(x, y+vsp, obj_wall)){
		while(!place_meeting(x, y+sign(vsp), obj_wall)){
			y = y + sign(vsp);
		}
		vsp = 0; 	
	}
	y = y + vsp;
}

#endregion