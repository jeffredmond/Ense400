///@description Textbox_Create_NPC_Transformation
///@arg npcID
///@arg first_sprite
///@arg player_sprite
///@arg room_to_goto

var npcID = argument0;
var Dafirstspr = argument1;
var player_spr = argument2; 
var daNextRoom = argument3;

var inst = instance_create_layer(0, 0, "Overlays", obj_level_completion);
with(inst){
	scr_npc_id						= npcID;
	scr_npc_spr						= Dafirstspr;
	scr_player_spr					= player_spr; 
	scr_next_room					= daNextRoom;
	event_perform(ev_other, ev_user0); 
}

TextBox_End_Action(); 
