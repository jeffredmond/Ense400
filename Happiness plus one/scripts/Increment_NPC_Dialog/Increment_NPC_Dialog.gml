///@description increment npc dialog
///@arg id of npc 

var inst = argument0;
with(inst)
{
	current_dialog++; 		
	event_perform(ev_other, ev_user0);
}