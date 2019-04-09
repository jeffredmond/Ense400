///@description Createdescription_box
///@arg text
///@arg senderId
draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
var description_box = instance_create_layer(0,0,"text", obj_textbox_item_description);
with(argument1){
	event_perform(ev_other, ev_user0);
}

with(description_box){
	text = argument0;
	senderID = argument1
	event_perform(ev_other, ev_user1); 
	
}

return description_box; 