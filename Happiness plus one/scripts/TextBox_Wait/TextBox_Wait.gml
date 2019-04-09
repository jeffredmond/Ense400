///@description Cutscene_Wait
///@arg seconds

timer++; 

if(timer>= argument0 * room_speed)
{
	timer = 0;
	TextBox_End_Action(); 
}