// set the constants for the player
event_inherited(); 

hsp = 0;
vsp = 0;
walksp = 4;

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


