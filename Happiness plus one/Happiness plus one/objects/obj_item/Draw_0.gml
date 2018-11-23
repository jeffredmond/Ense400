
if(item_num != -1){
	x_frame				= item_num mod(spr_width/cell_size);
	y_frame				= item_num div(spr_width/cell_size);
}


draw_sprite_part(
item_spr, 0, cell_size*x_frame, y_frame * cell_size,
cell_size, cell_size, x, y
); 