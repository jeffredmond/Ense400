guiWidth			= display_get_gui_width();
guiHeight			= display_get_gui_height();

interactKey			= vk_anykey; 

current_phase		= 0; 
timer				= 0; 

lines				= ds_map_create(); 
numberofLines		= 150; 
max_line_length		= 60; 
max_line_width		= 3;
line_speed			= 10; 
nolinebuffer		= 64;
nolinezonex1		= guiWidth/2 - nolinebuffer;
nolinezonex2		= guiWidth/2 + nolinebuffer; 
curline				= "line"
curlinex1			= "x1"
curliney1			= "y1"
curlinex2			= "x2"
curliney2			= "y2"
curlinewidth		= "width"

black_screen_alpha			= 1;
black_screen_alpha_inc		= 0.01; 
black_screen_alpha_buffer	= 3; 

edge_buffer			= 64;	
character_spr		= spr_into_falling; 
character_start_x	= guiWidth/2; 
character_start_y	= edge_buffer; 
character_fall_spd	= 0.7; 

dialog_x			=guiWidth/2;
dialog_y			=guiHeight/2; 
text_alpha			= 0;
text_alpha_inc		= 0.02;
text_time_buffer	= 1; 
text_display_buffer	= 0.8; 
text_display_time	= 1; 

light_spr			= spr_intro_light; 
light_x				= dialog_x; 
light_y				= dialog_y;
base_warble			= 7; 
light_warble		= base_warble; 
light_warble_range	= 0.5
light_warble_amount	= 0.02; 

icebed_y1			= guiHeight - guiHeight*(1/5)

icebroken_spr		= spr_intro_broken_ice;
icebroken_x			= guiWidth/2; 
icebroken_y			= guiHeight/2
icebroken_scale		= 1.5;
icebroken_scale_inc	= 0.01; 
icebroken_time_buff	= 5; 

player_2_spr		= spr_into_falling2;
player_2x			= guiWidth/2; 
player_2y			= guiHeight/2;
player_2y_buffer	= 64; 
player_2_size		= 5;
player_2shrink		= 0.009;
player_2alpha		= 1;
player_2alpha_inc	= 0.005;


player_3_spr		= spr_into_falling3;
player_3x			= guiWidth/2; 
player_3y			= guiHeight/2
player_3_size		= 1
player_3shrink		= 0.01
player_3alpha		= 0;
player_3alpha_inc	= 0.01

current_dialog		= 0;
cutscene_dialog		= [
"Falling", 
"How long have you been falling for?",
"Hours?",
"Minutes?",
"Years?",
"You can't remember",
"Everything is so hazy",
"But... There is one thing you can remember",
"That light from further above",
"Before you started falling", 
"The light that filled you with happiness",
"But, can you remember what the light was?",
"Further, and further down",
"Every hole has a bottom, right?",
"But then", //14
"Some are deeper than they appear",
"The first step back to that light begins down here",
"What places will the pursuit of your happiness take you?", 
"In these depths, only time can tell", 
];

// this is the lines passing by the player to look like they are falling. 
var xx = 0 repeat(numberofLines){
	var x1, y1, x2, y2, width, lineNx1, lineNy1, lineNx2, lineNy2, lineWidth; 
	x1 = floor(random_range(edge_buffer, guiWidth-edge_buffer)); 
	x2 = x1; 
	y1 = floor(random_range(0, guiHeight));
	y2 = y1 + floor(random_range(0, max_line_length));
	width = floor(random_range(0, max_line_width));
	
	lineNx1 = curline;
	lineNx1 += string(xx);
	lineNx1 += curlinex1;
	ds_map_add(lines, lineNx1, x1);

	lineNy1 = curline;
	lineNy1 += string(xx);
	lineNy1 += curliney1;
	ds_map_add(lines, lineNy1, y1);
	
	lineNx2 = curline;
	lineNx2 += string(xx);
	lineNx2 += curlinex2;
	ds_map_add(lines, lineNx2, x2);
	
	lineNy2 = curline;
	lineNy2 += string(xx);
	lineNy2 += curliney2;
	ds_map_add(lines, lineNy2, y2);
	
	lineWidth = curline;
	lineWidth += string(xx);
	lineWidth += curlinewidth;
	ds_map_add(lines, lineWidth,  width);
xx++; 
}

//room_goto_next(); 
