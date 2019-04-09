// set the constants for the player

event_inherited(); 

base	 = spr_locked_ash;
eye		 = spr_eye_clear;
hair	 = spr_hair_dark;
top		 = spr_top_dark;
pants	 = spr_pant_dark;
shoes	 = spr_shoe_dark; 	

des_room = rm_lv1_1; 

portrait_index  = 1;
voice			= snd_voice3;
name			= "Lost Soul: "

// create an array of text and speakers that can be incremented as dialog progresses. 
current_dialog	= 0; 
dialog_array	= [
	[ 
		[TextBox_hasControl_False], 
		"Huh?",
		"What do you want?",
		"You want to know what this place is?",
		"I'm not sure, but if I had to guess I would say it is a place trapped between worlds",
		"I'm not even sure how long I've been down here", 
		"I explored this whole place when I first fell here, and it's actually quite small",
		"To the north is a old park and an ice forest", 
		"To the east there is a oil pond", 
		"To the west is where I woke up after I fell here",
		"To the south...",
		"To the south is a maze, It's not a very big one though", 
		"I remember that there was something in the maze",
		"It was something that was nice, but it was out of reach", 
		"It was something that made me happy...", 
		[TextBox_increment_NPC_Dialog, id],
		[TextBox_hasControl_True],
	],
	[
		[TextBox_hasControl_False],
		"I haven't been to the maze in so long",
		"But that thing in the maze was a flower frozen in ice",
		"When I first saw it, it made me remember something",
		"I remembered something from back before I fell down here",
		"It was a memory of the sun, the wind, and a garden filled with roses",
		"That memory was a bright light that filled me up",
		"But the light has since faded away", 
		"And since then I just feel sad",
		[TextBox_increment_NPC_Dialog, id],
		[TextBox_hasControl_True],
	],
	[
		[TextBox_hasControl_False],
		"Now I just sit here, I don't know if we are dead or what",
		"But I have a feeling that I will never get out of here",
		[TextBox_increment_NPC_Dialog, id],
		[TextBox_hasControl_True],
	],
	[
		[TextBox_hasControl_False],
		"Please just let me sit in silence", 
		//[Textbox_check_inventory, item.flower],
		//[TextBox_increment_NPC_Dialog, id],
		[TextBox_hasControl_True], 
	], 
	//here will go in the section of dialog that will play the player transfromation scene
	[
		[TextBox_hasControl_False],
		"What is that you have there?",
		"Is that the rose from the maze?",
		"I want you to have it", 
		"... really? Thank you, it's so beautiful", 
		"ha ha, I think... it is the most beautiful thing that I have seen in a long time",
		"You know...",
		"After falling down I started to give up on ever feeling happy again, but right now",
		"You changed that",
		"For the first time in a long time I can see that bright light again",
		[Textbox_destory_inventory_item, item.flower], 
		[TextBox_Create_NPC_Transformation,id, spr_locked_ash, spr_unlocked_ash, obj_unlocked_ash],

	
	],
	// next the section that will play the level completion scene
]; 
speakers_array	= [
	[
		id, id, id, id, id,
		id, id, id, id, id,
		id, id, id, id, id,
		id, id, 
	],
	///
	[
		id, id, id, id, id,
		id, id, id, id, id,
		id, 
	],
	///
	[
		id, id, id, id, id, 
	],
	///
	[
		id, id, id,  
	], 
	[
		id, id, id, obj_player, id,  
		id, id, id, id, id, 
		id,	id, id,    
	],
]; 

	event_perform(ev_other, ev_user1); 
	event_perform(ev_other, ev_user0);