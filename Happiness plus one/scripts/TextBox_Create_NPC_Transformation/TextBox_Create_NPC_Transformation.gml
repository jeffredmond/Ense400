///@description Textbox_Create_NPC_Transformation
///@arg npcID
///@arg first sprite
///@arg resulting sprite
///@arg new npc id
var npcID = argument0;
var DaBase = argument1;
var nextBase = argument2; 
var newnpcid = argument3; 

var inst = instance_create_layer(0, 0, "Overlays", obj_npc_transformation);
with(inst){
	scr_npc_id						= npcID;
	scr_base						= DaBase;
	scr_new_base					= nextBase; 
	scr_new_npc_id					= newnpcid
	event_perform(ev_other, ev_user0); 
}

TextBox_End_Action(); 
