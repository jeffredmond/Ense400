// set the constants for the player

event_inherited(); 

base	 = spr_base_m1;
eye		 = spr_eye_green;
hair	 = spr_hair1;
top		 = spr_top1;
pants	 = spr_pant1;
shoes	 = spr_shoe1; 


portrait_index  = 1;
voice			= snd_voice2;
name			= "Allen: ";
var i = 0;
text[i++]		= "Hi! My name is Allen.";
text[i++]		= "I like to make puns";
text[i++]		= "Do you want to hear a pun";
text[i++]		= "Say something and I'll make a pun out of it";
text[i++]		= "..."; 
text[i++]		= "I already dont like you"; 
text[i++]		= "..."; 


speakers = [id, id, id, id, obj_player, obj_player, id];