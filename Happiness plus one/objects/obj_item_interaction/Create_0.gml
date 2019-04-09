
// so if i have anyting to do with the depth controlling object i will need to have 
// event_inherited(); here 
event_inherited();

text[0]				= "description of some item"; 
needed_item			= item.none; 
resulting_item		= item.none; 
has_been_picked_up	= false; 

orig_sprite			= noone;
sprite_indx			= 0; 

 
 
var curid = id; 
with(game){
	if(ds_list_size(item_interaction_list) > 0){
		for(var i = 0; i < ds_list_size(item_interaction_list); i++)
			{
				var _map = item_interaction_list[| i];
				if(_map[? "instance_id"] == curid){
					other.has_been_picked_up	=  _map[? "has_been_picked_up"];
					other.sprite_indx			=	_map[? "sprite_indx"];
			
				}
			}
	}
}