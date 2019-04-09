///@description Createdescription_box
///@arg text
///@arg needed_item
///@arg resulting_item
///@arg hasbeenpickedup

draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
var item_interaction_box = instance_create_layer(0,0,"text", obj_textbox_item_interaction);

with(item_interaction_box){
	text = argument[0];
	needed_item	= argument[1];
	resulting_item = argument[2];
	picked_up = argument[3];
	event_perform(ev_other, ev_user1); 
}

return item_interaction_box; 