/// @description Insert description here
// You can write your code in this editor
if (!is_undefined(npc_dialog_map)){
	ds_map_destroy(npc_dialog_map);
}
if (!is_undefined(item_interaction_list)){
	ds_list_destroy(item_interaction_list);
}
