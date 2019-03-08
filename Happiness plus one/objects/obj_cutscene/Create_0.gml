scene_info	 = -1;
scene		 = 0;

timer = 0; 

scene_info = [
	[Cutscene_Wait, 5],
	[Cutscene_Play_Sound(music_test, 1, false)],
	[Cutscene_Wait, 5],
	[Cutscene_Move_Character(obj_player, 35, 110, false, 10)],
	[Cutscene_Wait, 5],
	[Cutscene_Instance_Create(30, 100, "Instances", obj_allen)],
	[Cutscene_Move_Character(obj_allen, 100, 210, false, 10)],
];

x_dest = -1;
y_dest = -1; 