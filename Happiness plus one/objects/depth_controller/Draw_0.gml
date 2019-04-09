//this will resize the dsgrid depthgrid
var inst_num = instance_number(obj_parent_depth); 
var dgrid = ds_depthgrid; 

ds_grid_resize(dgrid, 2, inst_num); 

//this will add instances to the grid

var i = 0;  
with(obj_parent_depth){
	dgrid[# 0, i] = id;
	dgrid[# 1, i] = y; 
	i++; 
}

//sort the grid so that the lowest y is at the top. 

ds_grid_sort(dgrid, 1, true); 

// loop through the grid and draw all the instances. 

var j = 0;
var inst; 
repeat(inst_num){
	inst = dgrid[# 0, j];
	with(inst){
		event_perform(ev_draw, 0);		
	}
	j++;	
}