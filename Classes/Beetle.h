//
//  Beetle.h
//  Beetles
//
//  Created by вввв ввв on 5/21/09.
//  Copyright 2009 ввв. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "cocos2d.h"

#define DOCTOR_TYPE 15
#define METAL_TYPE 16
#define BOOMER_TYPE 17
#define FREEZ_TYPE 18
#define ROAR_TYPE 19
#define ELECTRO_TYPE 20

//#import "SoundSupport.h" //drm
//SoundSupport* game_sound; //drm

@interface Beetle : NSObject {
	CCSprite* sprite;
	id anm_move;
	id anm_eat;
	id anm_eat_doctor;
//	id anm_eat_freez;
	id anm_eat_roar;
	id anm_eat_boom;
	id anm_smash;
	id go_center;
	id go_center_no_delay;
	CGRect smash;
	CGRect freez;
	BOOL isSmashed;
	BOOL already_eat;   //drm
	BOOL waitstart;
	BOOL life;
	int mytype;
	int mydelay;
	BOOL doctoroff;
	BOOL ease;
	BOOL frozen;
	BOOL roared;
	int startX, startY;
}

@property (readwrite) BOOL already_eat;
@property (readwrite) BOOL waitstart;
@property (readonly) BOOL frozen;
@property (readonly) BOOL roared;
//@property (readwrite) BOOL life;
 
- (id) initWithType: (int) type anm:(id)anm anm1:(id)anm1 mgr:(CCSpriteBatchNode*)mgr delay:(int)delay;

- (void) moveto: (int)duration position:(CGPoint)p;
- (void) rotate: (CGPoint) p;
- (void) stop;
- (void) start;
- (void) start_no_delay: (CGPoint) p;
- (void) startEat;
- (CGRect) getRect;
- (BOOL) isSmashed;
- (BOOL) isSpec;
- (void) smash;
- (void) freez;
- (void) unfreez;
- (int) positionX;
- (int) positionY;
- (BOOL) actionsnumber;
- (void) eatCallback;
- (void) eatCallbackDoctor;
- (void) easeCallback;
- (BOOL) onScreen;
- (void) final;
- (BOOL) isDiedOutScreen;
- (BOOL) isDoctorOff;
- (void) setPosition: (CGPoint) p;
@end
