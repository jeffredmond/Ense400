// cutscene of npc transformation 

t_scene_info = [ 

	[Cutscene_hasControl_False],
	[Cutscene_Fade, 0, c_white, 0.01], 
	[Cutscene_Wait , 2.5], 
	[Cutscene_Fill_Color, c_white],
	[Cutscene_Wait , 3.5], 
	[Cutscene_Fade, 1, c_black, 0.01], 
	[Cutscene_Instance_Destroy,obj_fill_screen],
	[Cutscene_Fade, 0, c_black, 0.01], 
	[Cutscene_hasControl_True],
	[Cutscene_Instance_Destroy,inst_674F9B6C],

/*
	[Cutscene_check_flag, game, puzzle_one_solved],
	[Cutscene_Change_Variable, game, global.hasControl, false],
	[Cutscene_Instance_Create, obj_ash.x, obj_ash.y, "Instances", obj_npc_transformation],
	[Cutscene_Instance_Destroy(obj_ash)],
	[Cutscene_Play_Sound, snd_questioningTrumpet, 1, 0],
	[Cutscene_Wait, 5],
	[Cutscene_Instance_Create, obj_npc_transformation.x, obj_npc_transformation.y, "Instances", obj_unlocked_ash],
	[Cutscene_Change_Variable, game, global.hasControl, true], 
	//[Cutscene_Change_Variable, game, 
	[Cutscene_Instance_Destroy,inst_674F9B6C ], 
	*/
];
