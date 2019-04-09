/// @description Insert description here
// You can write your code in this editor


switch(current_phase){
	case transition.phase1:
		timer++;
		text_alpha += text_alpha_inc
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(font_titleScreen_options); 
		draw_text_ext_color(dialog_x, dialog_y, cutscene_dialog[current_dialog], 5, guiWidth, c_white, c_white, c_white, c_white, text_alpha)
		if(text_alpha >= 1 && timer> 3*room_speed){
			text_alpha = 1; 
			text_alpha_inc = (text_alpha_inc*(-1));
		}
		if(text_alpha < 0){
			current_dialog++;
			current_phase++;
			text_alpha = 0; 
			timer = 0;
			text_alpha_inc = (text_alpha_inc*(-1));
		}
	break;
	
	case transition.phase2:
 		timer++;
		var  lineNx1, lineNy1, lineNx2, lineNy2, lineWidth; 
		var xx = 0	repeat(numberofLines){		
			lineNx1 = curline;
			lineNx1 += string(xx);
			lineNx1 += curlinex1;
			
			lineNy1 = curline;
			lineNy1 += string(xx);
			lineNy1 += curliney1;
	
			lineNx2 = curline;
			lineNx2 += string(xx);
			lineNx2 += curlinex2;
	
			lineNy2 = curline;
			lineNy2 += string(xx);
			lineNy2 += curliney2;
			
			lineWidth = curline;
			lineWidth += string(xx);
			lineWidth += curlinewidth;
			
			lines[? lineNy1] -= line_speed;
			lines[? lineNy2] -= line_speed;

			if( lines[? lineNy2] <= 0){
				lines[? lineNx1] = floor(random_range(edge_buffer, guiWidth-edge_buffer)); 
				lines[? lineNx2] = lines[? lineNx1]; 
				lines[? lineNy1] = guiHeight;
				lines[? lineNy2] = lines[? lineNy1] + floor(random_range(0, max_line_length)); 
				lines[? lineWidth] =  floor(random_range(0, max_line_width));
			}	
			if(lines[? lineNx1] <= nolinezonex1 || lines[? lineNx1] >= nolinezonex2){
				draw_line_width( lines[? lineNx1], lines[? lineNy1], lines[? lineNx2], lines[? lineNy2], lines[? lineWidth]);
			}
			xx++; 
		}
 
		draw_sprite_ext(character_spr, 0, character_start_x, character_start_y, 1, 1, -15, c_white, 1);
		character_start_y += character_fall_spd; 
		
		if(black_screen_alpha >= 0){
			draw_set_alpha(black_screen_alpha);
			draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false)
			draw_set_alpha(1)
			black_screen_alpha -= black_screen_alpha_inc; 
		}
		
		if(black_screen_alpha < 0 && (timer > text_time_buffer*room_speed)){
			text_alpha += text_alpha_inc
			draw_text_ext_color(dialog_x, dialog_y, cutscene_dialog[current_dialog], 5, guiWidth, c_white, c_white, c_white, c_white, text_alpha)
			if(text_alpha >= 1 && (timer - text_time_buffer*2) > text_display_time*room_speed) {
				text_alpha_inc = (text_alpha_inc*(-1));
			}
			if(text_alpha < 0){
				current_dialog++;
				timer = 0; 
				text_alpha = 0; 
				text_alpha_inc = (text_alpha_inc*(-1));
			}
		}
		if(current_dialog == 8 && black_screen_alpha < 0){
			black_screen_alpha = 0; 
			black_screen_alpha_inc = black_screen_alpha_inc*-1; 
		}
		if(black_screen_alpha >= 1 && current_dialog == 8){
			timer = 0; 
			text_alpha = 0; 
			text_alpha_inc = abs(text_alpha_inc);
			black_screen_alpha_inc = abs(black_screen_alpha_inc); 
			black_screen_alpha = 1; 
			current_phase++; 
		}
	break;
	
	case transition.phase3 :	
		timer++; 
		
		light_warble += light_warble_amount
		if(light_warble > base_warble+light_warble_range){
			light_warble_amount = light_warble_amount*-1;	
		}
		else if (light_warble < base_warble - light_warble_range){
			light_warble_amount = abs(light_warble_amount); 	
		}
		
		draw_sprite_ext(light_spr, 0, light_x, light_y, light_warble, light_warble, 0, c_white, 1);
		
		if(black_screen_alpha < 0 && (timer > text_time_buffer*room_speed)){
			text_alpha += text_alpha_inc
			draw_text_ext_color(dialog_x, dialog_y, cutscene_dialog[current_dialog], 5, guiWidth, c_black, c_black, c_black, c_black, text_alpha)
			if(text_alpha >= 1 && timer > text_display_time*room_speed+text_time_buffer*room_speed){
			text_alpha_inc = (text_alpha_inc*(-1));
			}
			if(text_alpha < 0){
				current_dialog++;
				timer = 0; 
				text_alpha = 0; 
				text_alpha_inc = (text_alpha_inc*(-1));
			}
		}
		
		if(black_screen_alpha >= 0){
			draw_set_alpha(black_screen_alpha);
			draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false)
			draw_set_alpha(1)
			black_screen_alpha -= black_screen_alpha_inc; 
		}
		if(current_dialog == 13 && black_screen_alpha < 0){
			black_screen_alpha = 0; 
			black_screen_alpha_inc = black_screen_alpha_inc*-1; 
		}
		if(black_screen_alpha >= 1 && current_dialog == 13){
			timer = 0; 
			text_alpha = 0; 
			text_alpha_inc = abs(text_alpha_inc);
			black_screen_alpha_inc = abs(black_screen_alpha_inc); 
			black_screen_alpha = 1; 
			current_phase++; 
			character_start_y = edge_buffer; 
		}	
	break;

	case transition.phase4 :
		timer++; 
		
		if(black_screen_alpha < 0 && (timer > text_time_buffer*room_speed)){
			text_alpha += text_alpha_inc*text_display_buffer
			draw_text_ext_color(dialog_x, dialog_y, cutscene_dialog[current_dialog], 5, guiWidth, c_white, c_white, c_white, c_white, text_alpha)
			if(text_alpha >= 1 && timer > text_display_time*room_speed+text_time_buffer*room_speed){
			text_alpha_inc = (text_alpha_inc*(-1));
			}
			if(text_alpha < 0){
				current_dialog++;
				timer = 0; 
				text_alpha = 0; 
				text_alpha_inc = (text_alpha_inc*(-1));
			}
		}		
		
		draw_sprite_ext(character_spr, 0, character_start_x, character_start_y, 1, 1, -15, c_white, 1);
		character_start_y += character_fall_spd; 
		
		draw_rectangle_color(0, icebed_y1, guiWidth, guiHeight, c_white, c_white, c_white,c_white, false)

		if(black_screen_alpha >= 0){
			draw_set_alpha(black_screen_alpha);
			draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false)
			draw_set_alpha(1)
			black_screen_alpha -= black_screen_alpha_inc; 
		}
		if(current_dialog == 14 && black_screen_alpha < 0){
			black_screen_alpha = 0; 
			black_screen_alpha_inc = black_screen_alpha_inc*-1; 
		}
		if(black_screen_alpha >= 1 && current_dialog == 14){
			timer = 0; 
			text_alpha = 0; 
			text_alpha_inc = abs(text_alpha_inc);
			black_screen_alpha_inc = abs(black_screen_alpha_inc); 
			black_screen_alpha = 1; 
			current_phase++; 
		}	
	break;
	
	case transition.phase5 :
		timer++; 
		if(timer > icebroken_time_buff*room_speed && player_2alpha >=0){
			icebroken_scale += 4*icebroken_scale_inc; 	
			player_2alpha -= player_2alpha_inc; 
			player_3alpha += player_3alpha_inc; 	
		}else
		if(timer < icebroken_time_buff*room_speed && player_2alpha >=0){
			player_2_size -= player_2shrink;	
			icebroken_scale += icebroken_scale_inc; 
		}
		
		draw_sprite_ext(icebroken_spr, 0, icebroken_x, icebroken_y, icebroken_scale, icebroken_scale, 0, c_white, 1); 
		draw_sprite_ext(player_2_spr, 0, player_2x, player_2y, player_2_size, player_2_size, 0, c_white, player_2alpha);
		draw_sprite_ext(player_3_spr, 0, player_3x, player_3y, player_2_size, player_2_size, 0, c_white, player_3alpha);
		
		if(player_2alpha <=0 && (timer > text_time_buffer*room_speed)){
			text_alpha += text_alpha_inc*text_display_buffer;
			draw_text_ext_color(dialog_x, dialog_y, cutscene_dialog[current_dialog], 5, guiWidth, c_white, c_white, c_white, c_white, text_alpha)
			if(text_alpha >= 1 && timer > text_display_time*room_speed+text_time_buffer*room_speed){ 
			text_alpha_inc = (text_alpha_inc*(-1));
			}
			if(text_alpha < 0){
				current_dialog++;
				timer = 0; 
				text_alpha = 0; 
				text_alpha_inc = (text_alpha_inc*(-1));
			}
		}	

		if(black_screen_alpha >= 0){
			draw_set_alpha(black_screen_alpha);
			draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black,c_black, false)
			draw_set_alpha(1)
			black_screen_alpha -= black_screen_alpha_inc; 
		}
		if(current_dialog == 18 && black_screen_alpha < 0){
			black_screen_alpha = 0; 
			black_screen_alpha_inc = (black_screen_alpha_inc*-1)*0.8; 
		}
		if(black_screen_alpha >= 1 && current_dialog == 18){
			timer = 0; 
			text_alpha = 0; 
			text_alpha_inc = abs(text_alpha_inc);
			black_screen_alpha_inc = abs(black_screen_alpha_inc); 
			black_screen_alpha = 1; 
			current_phase++; 
		}		
	
	break;
	
	case transition.phase6:
	room_goto_next(); 
	break
}
