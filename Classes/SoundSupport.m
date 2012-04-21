//
//  SoundSupport.m
//  CowboyShooter
//
//  Created by DrMike on 5/11/09.
//  Copyright 2009 ввв. All rights reserved.
//

#import "SoundSupport.h"
#import "Common.h"
#import "cocos2d.h"
enum  {
	kSound_bug_step = 0,
	kSound_bug_attack,
	kSound_game_theme,//kSound_bug_fly,
	kSound_bug_dead,
	kSound_bugs_attack,
	kSound_bug_killer,
	kSound_bug_move,
	kSound_click1,
	kSound_click_pause,
	kSound_bug_dead1,
	kSound_bug_dead2,
	kSound_bug_dead3,
	kSound_bug_fly,
	
	kSound_b1,
	kSound_b2,
	kSound_b3,
	kSound_b4,
	kSound_b5,
	kSound_b6,
	kSound_b7,
	kSound_b8,
	kSound_b9,
	kSound_b10,
	kSound_b11,
	kSound_b12,
	kSound_b13,
	kSound_b14,	
	kSound_b15,
	
	kSound_levelup,
	
	kSound_anim_step,
	kSound_game_over,
	
	kApple_bomb,
	kApple_frize,
	kApple_medic,
	kApple_metal,
	kApple_roar,
	kApple_electro,
	kSound_bug_killer2,
	kNumSounds = 38
};

UInt32 sounds[kNumSounds];

@implementation SoundSupport
-(void) s_init{
	bundle = [NSBundle mainBundle];
	SoundEngine_Initialize(44100);
	SoundEngine_SetListenerPosition(0.0, 0.0, kListenerDistance);
	alredy_eat_play = NO;
	alredy_eatS_play = NO;
	alredy_step_play = NO;
	// ------ bug
	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"bug_step3" ofType:@"wav"] UTF8String],NULL, NULL, &sounds[kSound_bug_step]);
	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"Eat_1_mod3"/*"bug_dead_3"*/ ofType:@"wav"] UTF8String],NULL, NULL, &sounds[kSound_bug_attack]);
	//SoundEngine_LoadEffect([[bundle pathForResource:@"Eat_1_mod2"/*"bug_attack"*/ ofType:@"wav"] UTF8String], &sounds[kSound_bug_attack]);
	[self bug_attack_init];
	//SoundEngine_LoadEffect([[bundle pathForResource:@"bug_fly" ofType:@"wav"] UTF8String], &sounds[kSound_bug_fly]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"bug_dead" ofType:@"wav"] UTF8String], &sounds[kSound_bug_dead]);	
	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"bugs_a2" ofType:@"wav"] UTF8String],NULL, NULL, &sounds[kSound_bugs_attack]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"flyKiller" ofType:@"wav"] UTF8String], &sounds[kSound_bug_killer]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"bug_move2" ofType:@"wav"] UTF8String], &sounds[kSound_bug_move]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"click_1" ofType:@"wav"] UTF8String], &sounds[kSound_click1]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"click_pause" ofType:@"wav"] UTF8String], &sounds[kSound_click_pause]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"bug_dead_1" ofType:@"wav"] UTF8String], &sounds[kSound_bug_dead1]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"bug_dead_2" ofType:@"wav"] UTF8String], &sounds[kSound_bug_dead2]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"bug_dead_3" ofType:@"wav"] UTF8String], &sounds[kSound_bug_dead3]);	
	
	SoundEngine_LoadBackgroundMusicTrack([[bundle pathForResource:@"main_theme" ofType:@"m4a"] UTF8String], NO, NO);
	SoundEngine_StartBackgroundMusic(); //tmp
	SoundEngine_SetBackgroundMusicVolume(0.0); //tmp
	//SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"menu_theme_3" ofType:@"mp3"] UTF8String],NULL, NULL, &sounds[kSound_game_theme]);
	//SoundEngine_StartEffect(sounds[2]);
	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b1" ofType:@"wav"] UTF8String], &sounds[kSound_b1]);			
	SoundEngine_LoadEffect([[bundle pathForResource:@"b2" ofType:@"wav"] UTF8String], &sounds[kSound_b2]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b3" ofType:@"wav"] UTF8String], &sounds[kSound_b3]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b4" ofType:@"wav"] UTF8String], &sounds[kSound_b4]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b5" ofType:@"wav"] UTF8String], &sounds[kSound_b5]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b6" ofType:@"wav"] UTF8String], &sounds[kSound_b6]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b7" ofType:@"wav"] UTF8String], &sounds[kSound_b7]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b8" ofType:@"wav"] UTF8String], &sounds[kSound_b8]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b9" ofType:@"wav"] UTF8String], &sounds[kSound_b9]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"b10" ofType:@"wav"] UTF8String], &sounds[kSound_b10]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"b11" ofType:@"wav"] UTF8String], &sounds[kSound_b11]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"b12" ofType:@"wav"] UTF8String], &sounds[kSound_b12]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"b13" ofType:@"wav"] UTF8String], &sounds[kSound_b13]);		
	SoundEngine_LoadEffect([[bundle pathForResource:@"b14" ofType:@"wav"] UTF8String], &sounds[kSound_b14]);	
	SoundEngine_LoadEffect([[bundle pathForResource:@"b15" ofType:@"wav"] UTF8String], &sounds[kSound_b15]);	
	
	SoundEngine_LoadEffect([[bundle pathForResource:@"levelup2_mod" ofType:@"wav"] UTF8String], &sounds[kSound_levelup]);
	
	//SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"anim_step" ofType:@"wav"] UTF8String],NULL, NULL, &sounds[kSound_anim_step]);	
    SoundEngine_LoadEffect([[bundle pathForResource:@"anim_step1" ofType:@"wav"] UTF8String], &sounds[kSound_anim_step]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"gameover1" ofType:@"wav"] UTF8String], &sounds[kSound_game_over]);
	
	SoundEngine_LoadEffect([[bundle pathForResource:@"apple_bomb1" ofType:@"wav"] UTF8String], &sounds[kApple_bomb]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"apple_frize1" ofType:@"wav"] UTF8String], &sounds[kApple_frize]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"apple_medic1" ofType:@"wav"] UTF8String], &sounds[kApple_medic]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"apple_metal1" ofType:@"wav"] UTF8String], &sounds[kApple_metal]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"apple_roar2" ofType:@"wav"] UTF8String], &sounds[kApple_roar]);	
	
	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"electro" ofType:@"wav"] UTF8String],NULL, NULL, &sounds[kApple_electro]);
	SoundEngine_LoadEffect([[bundle pathForResource:@"flyKiller2" ofType:@"wav"] UTF8String], &sounds[kSound_bug_killer2]);	
	
	//SoundEngine_SetEffectsVolume(0.0);
	//[self bug_attack_init];
}	
// ------ bug
-(void) bug_step_start{
	alredy_step_play = YES;
	//SoundEngine_StartEffect(sounds[0]);
	if([Common instance].MusicONOFF && [Common instance].VolumeONOFF)
	[self musicON];

}
-(void) bug_step_stop{
	alredy_step_play = NO;
	//SoundEngine_StopEffect((sounds[0]), YES) ;
	//[self stopBGmusic];
	[self musicOFF];
	//SoundEngine_StopEffect((sounds[12]), YES) ;
}
-(BOOL) isPlayStep{
	return alredy_step_play;
}	

-(void) bug_attack_init{
	SoundEngine_StartEffect(sounds[1]);//tmp
	SoundEngine_SetEffectLevel(sounds[1], 0.0);//tmp
}

-(void) bug_attack_start{
	alredy_eat_play = YES;
	//SoundEngine_StartEffect(sounds[1]);//true
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	SoundEngine_SetEffectLevel(sounds[1], 1.0); //tmp
}

-(void) bug_attack_stop{
	alredy_eat_play = NO;
	//SoundEngine_StopEffect(sounds[1],YES);//true
	SoundEngine_SetEffectLevel(sounds[1], 0.0); //tmp
	SoundEngine_StopEffect(sounds[9],YES);
	SoundEngine_StopEffect(sounds[10],YES);
	SoundEngine_StopEffect(sounds[11],YES);
}

-(void) bugS_attack_start{
	alredy_eatS_play = YES;
	SoundEngine_StopEffect(sounds[4],YES);
	SoundEngine_StartEffect(sounds[4]);
	SoundEngine_Vibrate();
}

-(void) bugS_attack_stop{
	alredy_eatS_play = NO;
	SoundEngine_StopEffect(sounds[4],YES);
}

-(BOOL) isPlayEat{
	return alredy_eat_play;
}	

-(BOOL) isPlayEatS{
	return alredy_eatS_play;
}	

-(void) bug_fly{
	SoundEngine_StartEffect(sounds[2]);
}
-(void) bug_dead{
	SoundEngine_StopEffect(sounds[6], NO);
	int num_kind = CCRANDOM_0_1() * 4;
	switch (num_kind) {
		case 0:
			SoundEngine_StartEffect(sounds[3]);
			break;
		case 1:
			SoundEngine_StartEffect(sounds[9]);
			break;
		case 2:
			SoundEngine_StartEffect(sounds[10]);
			break;
		case 3:
			SoundEngine_StartEffect(sounds[11]);
			break;	
		default:
			SoundEngine_StartEffect(sounds[3]);
			break;
	}
}
-(void) bug_killer{
	SoundEngine_StartEffect(sounds[5]);
}
-(void) bug_killer2{
	SoundEngine_StartEffect(sounds[37]);
}

-(void) bug_move{
	SoundEngine_StartEffect(sounds[6]);
}

-(void) click_01{
	SoundEngine_StartEffect(sounds[7]);
}

-(void) click_pause{
	SoundEngine_StartEffect(sounds[8]);
}

- (void) bug_muteON{
	SoundEngine_SetEffectLevel(sounds[0], 0.0);
	SoundEngine_SetEffectLevel(sounds[1], 0.0);
	SoundEngine_SetEffectLevel(sounds[3], 0.0);
	SoundEngine_SetEffectLevel(sounds[4], 0.0);
	SoundEngine_SetEffectLevel(sounds[5], 0.0);
	SoundEngine_SetEffectLevel(sounds[6], 0.0);	
	SoundEngine_SetEffectLevel(sounds[9], 0.0);	
	SoundEngine_SetEffectLevel(sounds[10], 0.0);	
	SoundEngine_SetEffectLevel(sounds[11], 0.0);
	
	SoundEngine_SetEffectLevel(sounds[12], 0.0);
	SoundEngine_SetEffectLevel(sounds[13], 0.0);
	SoundEngine_SetEffectLevel(sounds[14], 0.0);
	SoundEngine_SetEffectLevel(sounds[15], 0.0);
	SoundEngine_SetEffectLevel(sounds[16], 0.0);
	SoundEngine_SetEffectLevel(sounds[17], 0.0);
	SoundEngine_SetEffectLevel(sounds[18], 0.0);
	SoundEngine_SetEffectLevel(sounds[19], 0.0);
	SoundEngine_SetEffectLevel(sounds[20], 0.0);
	SoundEngine_SetEffectLevel(sounds[21], 0.0);
	SoundEngine_SetEffectLevel(sounds[22], 0.0);
	SoundEngine_SetEffectLevel(sounds[23], 0.0);
	SoundEngine_SetEffectLevel(sounds[24], 0.0);
	SoundEngine_SetEffectLevel(sounds[25], 0.0);
	SoundEngine_SetEffectLevel(sounds[26], 0.0);
	SoundEngine_SetEffectLevel(sounds[27], 0.0);
	SoundEngine_SetEffectLevel(sounds[28], 0.0);
	SoundEngine_SetEffectLevel(sounds[29], 0.0);
	SoundEngine_SetEffectLevel(sounds[31], 0.0);
	SoundEngine_SetEffectLevel(sounds[32], 0.0);
	SoundEngine_SetEffectLevel(sounds[33], 0.0);
	SoundEngine_SetEffectLevel(sounds[34], 0.0);
	SoundEngine_SetEffectLevel(sounds[35], 0.0);
	SoundEngine_SetEffectLevel(sounds[36], 0.0);
	SoundEngine_SetEffectLevel(sounds[37], 0.0);

	//SoundEngine_SetEffectLevel(sounds[8], 0.0);	
}
- (void) bug_muteOFF{
	SoundEngine_SetEffectLevel(sounds[0], 1.0);
//	SoundEngine_SetEffectLevel(sounds[1], 1.0);
	SoundEngine_SetEffectLevel(sounds[3], 1.0);
	SoundEngine_SetEffectLevel(sounds[4], 1.0);
	SoundEngine_SetEffectLevel(sounds[5], 1.0);
	SoundEngine_SetEffectLevel(sounds[6], 1.0);
	SoundEngine_SetEffectLevel(sounds[9], 1.0);
	SoundEngine_SetEffectLevel(sounds[10], 1.0);
	SoundEngine_SetEffectLevel(sounds[11], 1.0);
	
	SoundEngine_SetEffectLevel(sounds[12], 1.0);
	SoundEngine_SetEffectLevel(sounds[13], 1.0);
	SoundEngine_SetEffectLevel(sounds[14], 1.0);
	SoundEngine_SetEffectLevel(sounds[15], 1.0);
	SoundEngine_SetEffectLevel(sounds[16], 1.0);
	SoundEngine_SetEffectLevel(sounds[17], 1.0);
	SoundEngine_SetEffectLevel(sounds[18], 1.0);
	SoundEngine_SetEffectLevel(sounds[19], 1.0);
	SoundEngine_SetEffectLevel(sounds[20], 1.0);
	SoundEngine_SetEffectLevel(sounds[21], 1.0);
	SoundEngine_SetEffectLevel(sounds[22], 1.0);
	SoundEngine_SetEffectLevel(sounds[23], 1.0);
	SoundEngine_SetEffectLevel(sounds[24], 1.0);
	SoundEngine_SetEffectLevel(sounds[25], 1.0);
	SoundEngine_SetEffectLevel(sounds[26], 1.0);
	SoundEngine_SetEffectLevel(sounds[27], 1.0);
	SoundEngine_SetEffectLevel(sounds[28], 1.0);
	SoundEngine_SetEffectLevel(sounds[29], 1.0);
	SoundEngine_SetEffectLevel(sounds[31], 1.0);
	SoundEngine_SetEffectLevel(sounds[32], 1.0);
	SoundEngine_SetEffectLevel(sounds[33], 1.0);
	SoundEngine_SetEffectLevel(sounds[34], 1.0);
	SoundEngine_SetEffectLevel(sounds[35], 1.0);
	SoundEngine_SetEffectLevel(sounds[36], 1.0);
	SoundEngine_SetEffectLevel(sounds[37], 1.0);	
	//SoundEngine_SetEffectLevel(sounds[8], 1.0);		
}	
- (void) muteON{
	SoundEngine_SetEffectsVolume(0.0);
//	SoundEngine_SetBackgroundMusicVolume(0.0);
	//SoundEngine_SetEffectLevel(sounds[3], 0.0);
}
- (void) muteOFF{
	SoundEngine_SetEffectsVolume(1.0);	
//	SoundEngine_SetBackgroundMusicVolume(1.0);
	//SoundEngine_SetEffectLevel(sounds[3], 1.0);
}	

- (void) startBGmusic{
//if([Common instance].MusicONOFF && [Common instance].VolumeONOFF)
	{
		//SoundEngine_StopEffect(sounds[2], NO);
		//SoundEngine_LoadBackgroundMusicTrack([[bundle pathForResource:@"main_theme" ofType:@"m4a"] UTF8String], NO, NO);
		//SoundEngine_StartBackgroundMusic(); //true
		SoundEngine_SetBackgroundMusicVolume(1.0); //tmp
	}
}

- (void) stopBGmusic{
	//SoundEngine_StopBackgroundMusic(NO);//true
	SoundEngine_SetBackgroundMusicVolume(0.0); //tmp
	//SoundEngine_UnloadBackgroundMusicTrack();
	//SoundEngine_StartEffect(sounds[2]);	
}

- (void) musicON{
	//SoundEngine_SetEffectLevel(sounds[3], 1.0);	
	//SoundEngine_StartBackgroundMusic();
	SoundEngine_SetBackgroundMusicVolume(1.0);		
}

- (void) musicOFF{
	//SoundEngine_SetEffectLevel(sounds[3], 0.0);
	SoundEngine_SetBackgroundMusicVolume(0.0);	
	//SoundEngine_StopBackgroundMusic(NO);
}

- (void) menu_themeON{
	SoundEngine_SetEffectLevel(sounds[2], 1.0);
}
- (void) menu_themeOFF{
	SoundEngine_SetEffectLevel(sounds[2], 0.0);	
}
//- (void) bad_set_volume: (Float32) vlm{
//	SoundEngine_SetEffectLevel(sounds[0], vlm);
//	SoundEngine_SetEffectLevel(sounds[1], vlm);
//	SoundEngine_SetEffectLevel(sounds[2], vlm);
//	SoundEngine_SetEffectLevel(sounds[3], vlm);	
//}
- (void) bonus_play : (int) score_num{
	/*for (int i = 1; i < 1000; i++) {
		if((i * 1000) == score_num)
		{
			//while (i > 13) i-=13;
			int tmp_index = CCRANDOM_0_1() * 14;
			if (i > 14) SoundEngine_StartEffect(sounds[13+tmp_index]);
			else		SoundEngine_StartEffect(sounds[13+i]);
			
			break;
		}
	}*/
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	SoundEngine_StartEffect(sounds[12+score_num]);
	//SoundEngine_StartEffect(sounds[13]);
}


- (void) play_levelup{
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
		SoundEngine_StartEffect(sounds[28]);
}

- (void) anim_step_start{
	SoundEngine_StartEffect(sounds[29]);
}

- (void) anim_step_stop{
	//SoundEngine_StopEffect(sounds[29], YES);
}

- (void) play_gameover{
	SoundEngine_StartEffect(sounds[30]);
}


- (void) play_bomb{
	SoundEngine_StartEffect(sounds[31]);
}

- (void) play_frize{
	SoundEngine_StartEffect(sounds[32]);
}

- (void) play_medic{
	SoundEngine_StartEffect(sounds[33]);
}

- (void) play_metal{
	SoundEngine_StartEffect(sounds[34]);
}

- (void) play_roar{
	SoundEngine_StartEffect(sounds[35]);
}

- (void) electro_start{
	SoundEngine_StartEffect(sounds[36]);
}

- (void) electro_stop{
	SoundEngine_StopEffect(sounds[36], NO);
}
@end