
if(global.NPCTransforming) exit;
if(room != des_room) exit; 

	//draw_self(); 
var animation_length	= 9;
var cell_size			= 64; 
var animation_speed		= 12;  

if(moveLR < 0)		y_frame = 1;  
else if(moveLR > 0) y_frame = 2; 
else if(moveUD < 0) y_frame = 3;
else if(moveUD > 0) y_frame = 0; 
else				x_frame = 0; 

var xx = x - x_offset;
var yy = y - y_offset; 


if(x_frame + (animation_speed/30) < animation_length){
	x_frame += animation_speed/30; 
} else {
	x_frame = 0; 
}

//draw character base
if(base != -1) draw_sprite_part(base, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 

//draw character eye color
if(eye != -1)  draw_sprite_part(eye, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 

//draw character hair
if(hair != -1) draw_sprite_part(hair, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 

//draw character top
if(top != -1)  draw_sprite_part(top, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 

//draw character shoes
if(shoes != -1) draw_sprite_part(shoes, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 

//draw character pants
if(pants != -1) draw_sprite_part(pants, 0, floor(x_frame)*cell_size, y_frame * cell_size, cell_size, cell_size, xx,yy); 



