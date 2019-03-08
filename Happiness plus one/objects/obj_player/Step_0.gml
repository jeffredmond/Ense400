/// @description Insert description here
// You can write your code in this editor

if (!global.hasControl) exit; 

#region

//initialize the particle system 
part_emitter_region(global.P_System, global.Emitter1, x - parxl_offset, x + parxr_offset , y - paryu_offset , y + paryd_offset , ps_shape_rectangle, ps_distr_invgaussian);


// get user input 
key_left  =  keyboard_check(vk_left);
key_right =  keyboard_check(vk_right);
key_up    =  keyboard_check(vk_up);
key_down  =  keyboard_check(vk_down);

//check for collision with NPC objects
interaction	= keyboard_check_pressed(ord("Z")); 
	
//calculate movement
moveLR = key_right - key_left;
moveUD = key_down - key_up;
hsp = moveLR * walksp;
vsp = moveUD * walksp;
	
// horizontal collision detection
if(hsp!= 0){
	var runintoH = instance_place(x+hsp, y, obj_wall);
	if(place_meeting(x+hsp, y, obj_wall) && runintoH.collideable){
		while(!place_meeting(x+sign(hsp),y, obj_wall)){
			x = x + sign(hsp); 
		}
		hsp = 0;
	}
	x = x + hsp; 
}
// vertical collison detection
	
if(vsp != 0){
	var runintoV = instance_place(x, y+vsp, obj_wall);
	if(place_meeting(x, y+vsp, obj_wall) && runintoV.collideable){
		while(!place_meeting(x, y+sign(vsp), obj_wall)){
			y = y + sign(vsp);
		}
		vsp = 0; 	
	}
	y = y + vsp;
}

//textbox
if(interaction){
	if(active_textbox == noone){
		var inst  = collision_rectangle( x - radius, y - radius, x + radius, y + radius, obj_parent_npc, false, false)	
		if(inst != noone){
			with(inst){
				var tbox = CreateTextbox(text, speakers); 
				can_move = false;
			}
			active_textbox = tbox; 
		}
	}else {
		if(!instance_exists(active_textbox)){
			active_textbox = noone; 
		}
	}
}


#endregion


	