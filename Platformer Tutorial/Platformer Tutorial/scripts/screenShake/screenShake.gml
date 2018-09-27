///@desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the strenght of the shade (radius in pixles)
/// @arg Frames sets the lenght  of the shake in frames (60 = 1 second)

with(obj_camera)
{
	if(argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_lenght = argument1; 
	}
}
