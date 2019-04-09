// set the constants for the player

event_inherited(); 

des_room = rm_lv1_1; 

base	 = spr_unlocked_ash;
eye		 = spr_eye_clear;
hair	 = spr_hair_dark;
top		 = spr_top_dark;
pants	 = spr_pant_dark;
shoes	 = spr_shoe_dark; 	


portrait_index  = 2;
voice			= snd_voice3;
name			= "Ash: "
//text[0]			= "what you looking at?"
//speakers = [id];

// create an array of text and speakers that can be incremented as dialog progresses. 
current_dialog	= 0; 
dialog_array	= [
	[	
		[TextBox_hasControl_False],
		"I remember now...",
		"My name was Ash",
		"I mean, my name is Ash",
		"Thank you for helping me remember, I have been just a ghost of my old self for so long",
		"For some reason I still can't remember how I got down here but, I can remember who I was", 
		"I was a gardener, I had a family in the country", 
		"Because of you I get to remember all these things I had forgotten, and feel happy once more",
		[TextBox_hasControl_True],
		[TextBox_Create_Level_Completion, id, spr_unlocked_ash, spr_locked_base1, rm_lv2_1],

	],
]; 
speakers_array	= [
	[
		id, id, id, id, id,
		id, id, id, id, id, 
	],
]; 


	event_perform(ev_other, ev_user1); 
	event_perform(ev_other, ev_user0);