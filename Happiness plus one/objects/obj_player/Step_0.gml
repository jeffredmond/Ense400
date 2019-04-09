/// @description Insert description here
// You can write your code in this editor

if (!global.hasControl) exit; 
//here is an attempt to fix a issue with loading from in game 
if(game.playerx != -1 && game.playery != -1) {
	x = game.playerx;
	y = game.playery;
	game.playerx = -1;
	game.playery = -1; 
}




#region

//initialize the particle system 
//part_emitter_region(global.P_System, global.Emitter1, x - parxl_offset, x + parxr_offset , y - paryu_offset , y + paryd_offset , ps_shape_rectangle, ps_distr_invgaussian);


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

//Get the direction the player is facing 
if(moveLR != 0){
	switch(sign(moveLR)){
		case 1 : facing = dir.right; break;
		case -1: facing = dir.left; break; 
	}
} else if(moveUD != 0){
	switch(sign(moveUD)){
		case 1 : facing = dir.down; break;
		case -1: facing = dir.up; break; 
	}
} else {
	facing = -1; 
}
	
	
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

//collision with transition objects

var inst = instance_place(x, y, obj_transfer_room); 
if(inst != noone && facing = inst.playerFacingBefore){
	with(game){	
		if(!doTransition){
			spawnRoom = inst.nextroom; 
			spawnX = inst.nextroom_x;
			spawnY = inst.nextroom_y; 
			spawnPlayerFacing = inst.playerFacingAfter; 
			doTransition = true; 
		}
	}
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

//item description object. 
if(interaction){
	if(active_description_box == noone && active_textbox == noone){
		var inst  = collision_rectangle( x - radius, y - radius, x + radius, y + radius, obj_item_description, false, false)	
		if(inst != noone){
			with(inst){
				var tbox = CreateDescriptionBox(text, id); 
			}
			active_description_box = tbox; 
		}
	}else {
		if(!instance_exists(active_description_box)){
			active_description_box = noone; 
		}
	}
}

// item interaction objects
if(interaction){
	if(active_interaction_box == noone && active_textbox == noone){
		var inst  = collision_rectangle( x - radius, y - radius, x + radius, y + radius, obj_item_interaction, false, false)	
		if(inst != noone){
			with(inst){
				var tbox = Create_Item_Interaction_Box(text, needed_item, resulting_item, has_been_picked_up); 
			}
			active_interaction_box = tbox; 
		}
	}else {
		if(!instance_exists(active_interaction_box)){
			active_interaction_box = noone; 
		}
	}
}

#endregion


	