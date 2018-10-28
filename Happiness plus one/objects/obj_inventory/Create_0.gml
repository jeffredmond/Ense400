/// @description Inventory
/*
key = 0
boxing glove = 1
stick = 2
feather = 3
boxingGloveArrow = 4
*/

globalvar showInventory;
globalvar maxItems;
globalvar maxItemW;
globalvar maxItemH; 

buffer = 0; 

showInventory = false;
maxItemH = 3;
maxItemW = 3;
maxItems = 9; 


for(i = 0; i < maxItemW; i++)
{
	for(j = 0; j < maxItemH; j++)
		{
			global.inventory[i,j] = -1;
		}
}


/*
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32; 

menu_x = gui_width + 200; 
menu_y = gui_height - gui_margin; //  + 200; 
menu_x_target = gui_width - gui_margin;
menu_speed = 25; // lower is faster
menu_font = fMenu; 
menu_item_height = font_get_size(fMenu);
menu_comitted = -1; 
menu_control = true; 

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit"; 

menu_items = array_length_1d(menu);
menu_cursor = 2; 


*/