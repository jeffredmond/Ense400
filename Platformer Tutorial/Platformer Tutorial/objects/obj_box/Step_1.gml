if(hp <= 0)
{
	with(instance_create_layer(x, y, layer, obj_box_dead))
	{
	direction = other.hitfrom;
	hsp = lengthdir_x(10, direction);
	hvp = (lengthdir_y(3, direction) - 110);
	if (sign(hsp != 0)) image_xscale = sign(hsp);

	}
	
	instance_destroy();	
}
