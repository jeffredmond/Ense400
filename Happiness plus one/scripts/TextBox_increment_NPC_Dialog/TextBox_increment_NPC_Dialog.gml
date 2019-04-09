///@description increment npc dialog
///@arg npc id
var npc = argument0; 
with (npc){
	current_dialog++;
	event_perform(ev_other, ev_user0);
}
TextBox_End_Action()
