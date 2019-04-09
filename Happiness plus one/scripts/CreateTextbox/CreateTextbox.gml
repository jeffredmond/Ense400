///@description CreateTextbox
///@arg text
///@arg speakers

draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
var textbox = instance_create_layer(0,0,"text", obj_textbox);

with(textbox){
	text = argument[0];
	speakers = argument[1]; 
	
	var len = array_length_1d(text);
	var i = 0; repeat(len){
		spkrs[i]		= speakers[i];	
		names[i]		= speakers[i].name;
		portraits[i]	= speakers[i].portrait_index;
		voices[i]		= speakers[i].voice; 
		i++; 
	}
	event_perform(ev_other, ev_user1); 
}

return textbox; 