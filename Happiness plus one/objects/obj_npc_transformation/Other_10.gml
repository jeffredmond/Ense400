
npc_id						= scr_npc_id;
base						= scr_base;
new_base					= scr_new_base; 
new_npc_id					= scr_new_npc_id	
global.NPCTransforming		= true;

with(obj_camera)
{
	follow = other.npc_id; 
}