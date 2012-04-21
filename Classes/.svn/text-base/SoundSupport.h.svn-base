//
//  SoundSupport.h
//  CowboyShooter
//
//  Created by DrMike on 5/11/09.
//  Copyright 2009 ввв. All rights reserved.
//

#import "SoundEngine.h" //drm
#import <UIKit/UIKit.h>

#define kListenerDistance 1.0 //drm

@interface SoundSupport : NSObject {
@public	
	int curr_sound;
	BOOL alredy_eat_play;
	BOOL alredy_eatS_play;
	BOOL alredy_step_play;
	NSBundle *bundle;
}
- (void) s_init;

- (void) bug_step_start;
- (void) bug_step_stop;
-(BOOL) isPlayStep;
- (BOOL) isPlayEat;
- (BOOL) isPlayEatS;
- (void) bug_attack_init;
- (void) bug_attack_start;
- (void) bug_attack_stop;
- (void) bugS_attack_start;
- (void) bugS_attack_stop;
- (void) bug_fly;
- (void) bug_dead;
//- (void) bug_sounds_stop;
- (void) bug_killer;
- (void) bug_killer2;
- (void) bug_move;

-(void) click_01;
-(void) click_pause;

- (void) bug_muteON;
- (void) bug_muteOFF;

- (void) startBGmusic;
- (void) stopBGmusic;
- (void) musicON;
- (void) musicOFF;

- (void) muteON;
- (void) muteOFF;

- (void) bonus_play : (int) score_num;

- (void) play_levelup;
- (void) play_gameover;

- (void) anim_step_start;
- (void) anim_step_stop;


- (void) play_bomb;
- (void) play_frize;
- (void) play_medic;
- (void) play_metal;
- (void) play_roar;
- (void) electro_start;
- (void) electro_stop;
@end
