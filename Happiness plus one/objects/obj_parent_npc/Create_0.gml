// set the constants for the player
event_inherited(); 

hsp = 0;
vsp = 0;
walksp = 4;

des_room = noone; 

timer = 0; 

moveLR = hsp;
moveUD = vsp;
can_move = true; 

x_frame = 1;
y_frame = 0; 

x_offset = sprite_get_xoffset(sprite_index);
y_offset = sprite_get_yoffset(sprite_index); 

base	 = -1;
eye		 = -1;
hair	 = -1;
top		 = -1;
pants	 = -1;
shoes	 = -1; 

portrait_index  = 0;
voice			= snd_voice2;
name			= "???: "
text[0]			= "what you looking at?"

//this shows the order in which the characters will be talking .
speakers = [id];

// create an array of text and speakers that can be incremented as dialog progresses. 
current_dialog	= 0; 
dialog_array[0]	= -1; 
speakers_array[0]	= -1

with(game){
	var inst = ds_map_find_value(npc_dialog_map, object_get_name(id));
	if (!is_undefined(inst)){
		other.current_dialog = inst; 	
	}
}

event_perform(ev_other, ev_user1); 
event_perform(ev_other, ev_user0);