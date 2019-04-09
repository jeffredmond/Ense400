/// @description Insert description here
// You can write your code in this editor
var halfw = w * 0.5;

//drawing the box

draw_set_color(c_black);
draw_set_alpha(1);
draw_roundrect_ext(x-halfw-border, y-h-(border*2), x+halfw+border,y,15,15,false);

//drawing text
DrawSetText(c_white,font_sign, fa_center,fa_top); 
draw_text(x,y-h-border,text_current); 
draw_set_halign(fa_left);
 
