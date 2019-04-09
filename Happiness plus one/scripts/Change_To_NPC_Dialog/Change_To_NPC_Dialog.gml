///@description increment npc dialog
///@arg id of npc 
///@arg new_dialog 
var inst = argument0;
var new_cur_dialog = argument1; 
with(inst)
{
	current_dialog = new_cur_dialog;  		
	event_perform(ev_other, ev_user0);
}