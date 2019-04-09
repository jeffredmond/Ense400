/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(font_intro_title);
draw_text(title_x, title_y, "Happiness Plus 1");

draw_set_font(font_titleScreen_options);
draw_text(cont_x, cont_y, "<Press any key to continue>");

if(rmEnter){
	fadeAlpha -= fadeAlphaInc; 
	draw_set_alpha(fadeAlpha);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false); 
	draw_set_alpha(1);
	if(fadeAlpha <= 0){
		rmEnter = false;
	}
}

if(rmTrans){
	fadeAlpha += fadeAlphaInc;
	draw_set_alpha(fadeAlpha)
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false); 
	draw_set_alpha(1);
	if(fadeAlpha >= 1){
		room_goto_next();
		instance_destroy();
		exit; 
	}
}
	
	

