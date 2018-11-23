// set the constants for the player

hsp = 0;
vsp = 0;
grv = 0;
walksp = 4;
globalvar hasControl;
hasControl = true;


// try testing out particle effects on the player object 
// in this i will attempt to have particles originate from the centre of the player and float upwards for 
// one or so second and then have them disappear
global.P_System = part_system_create_layer(layer, 1);
global.Particle1 = part_type_create(); 

part_type_blend(global.Particle1, true);
part_type_shape(global.Particle1, pt_shape_pixel);
part_type_size(global.Particle1, 0.1, 2, 0, 1); 
part_type_colour3(global.Particle1, $FFFF2600 & $FFFFFF, $FF00FFFF & $FFFFFF, $FF0000FF & $FFFFFF);
part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_speed(global.Particle1, 0, 0, 0, 0);
part_type_direction(global.Particle1, 0, 360, 0, 0); 
part_type_gravity(global.Particle1, 0.1, 90)
part_type_direction(global.Particle1, 0, 360, 0.5, 0);
part_type_life(global.Particle1, 40, 50);

global.Emitter1 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter1, x - 10, x + 10, y , y + 20, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(global.P_System, global.Emitter1, global.Particle1, 2); 

alarm_set(0, room_speed); 


// this section will create the the DS list that will contain all of the inventory items
globalvar inventory;
inventory = ds_list_create(); 