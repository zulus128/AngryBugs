//
//  Beetle.m
//  Beetles
//
//  Created by вввв ввв on 5/21/09.
//  Copyright 2009 ввв. All rights reserved.
//

#import "Beetle.h"
#import "Common.h"
#import "GameScene1.h"

@implementation Beetle

@synthesize already_eat;
@synthesize waitstart;
@synthesize frozen;
@synthesize roared;
//@synthesize life;

- (id) initWithType: (int) type anm:(id)anm anm1:(id)anm1 mgr:(CCSpriteBatchNode*)mgr delay:(int)delay {
	self = [super init];
	if(self !=nil) {
		
		mytype = type;
		mydelay = delay;
		
		self.already_eat = NO;
		//NSLog(@"INIT %d", [self retainCount]);
		CGRect rect = [[Common instance] readPlist: [NSString stringWithFormat:@"bug%02d_move01.png", type+1]];
//		sprite = [[CCSprite spriteWithRect:rect spriteManager:mgr] retain];
		sprite = [[CCSprite spriteWithBatchNode:mgr rect:rect] retain];
		//sprite.autoCenterFrames = YES;
		[mgr addChild:sprite];
		
		anm_move = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anm]]retain];
		
		//NSLog(@"INIT_ %d", [self retainCount]);
		
		//		anm_eat = [[RepeatForever actionWithAction:[Animate actionWithAnimation: anm1]]retain];
		anm_eat = [[CCRepeatForever actionWithAction:[CCSequence actions:
													[CCAnimate actionWithAnimation: anm1],
													[CCCallFunc actionWithTarget:self selector:@selector(eatCallback)],
													nil]]retain];

		anm_eat_doctor = [[CCSequence actions:
						   [CCRepeat actionWithAction:[CCAnimate actionWithAnimation: anm1] times:25],
						   [CCCallFunc actionWithTarget:self selector:@selector(eatCallbackDoctor)],
						   nil]retain];

		anm_eat_roar = [[CCSequence actions:
						   [CCRepeat actionWithAction:[CCAnimate actionWithAnimation: anm1] times:15],
						   [CCCallFunc actionWithTarget:self selector:@selector(eatCallbackDoctor)],
						   nil]retain];
		
//		anm_eat_freez = [[Sequence actions:
//						   [Repeat actionWithAction:[Animate actionWithAnimation: anm1] times:25],
//						   [CallFunc actionWithTarget:self selector:@selector(eatCallbackDoctor)],
//						   nil]retain];
		
		anm_eat_boom = [[CCSequence actions:
						 [CCAnimate actionWithAnimation: anm1 restoreOriginalFrame: NO],
						   [CCCallFunc actionWithTarget:self selector:@selector(eatCallbackDoctor)],
						   nil]retain];
		
		int min = [[Common instance]getParams:@"Minimum time to target"];
		int max = [[Common instance]getParams:@"Maximum time to target"];
		int d = CCRANDOM_0_1() * (max-min) + min;
		
		go_center = [[CCSequence actions:
					  [CCDelayTime actionWithDuration:delay],
					  [CCMoveTo actionWithDuration:d position:ccp(APPLE_X, APPLE_Y)],
					  nil]retain];
		
		go_center_no_delay = [[CCMoveTo actionWithDuration:d position:ccp(APPLE_X, APPLE_Y)]retain];
		
		smash = [[Common instance] readPlist: [NSString stringWithFormat:@"smashed%02d.png", type+1]];

		freez = [[Common instance] readPlist: [NSString stringWithFormat:@"frozen%02d.png", type+1]];
		
		anm_smash = [[CCSequence actions:
					  //			  [Animate actionWithAnimation: anm_s],
					  [CCDelayTime actionWithDuration:2],
					  [CCFadeOut actionWithDuration:2],
					  nil]retain];
		
		int x = CCRANDOM_0_1() * 480;
		int y = CCRANDOM_0_1() * 320;
		int s = CCRANDOM_0_1() * 4;
		switch (s) {
			case 0:
				x = -40;
				break;
			case 1:
				y = 360;
				break;
			case 2:
				x = 530;
				break;
			case 3:
				y = -40;
				break;
			default:
				break;
		}
		
		sprite.position = ccp(x,y);
		
		startX = x;
		startY = y;
		
		//[self start];
		waitstart = YES;
		isSmashed = NO;
		sprite.visible = YES;
		doctoroff = NO;
		ease  = NO;
		frozen = NO;
		roared = NO;
		life = 3;
	}
	
	return self;	
}

- (BOOL) isDoctorOff {

	return doctoroff;
}

- (BOOL) isDiedOutScreen {
	
	if(life <= 0) {
		life = 1;
		return YES;
	}
	return NO;
}

- (void) dealloc{
	//NSLog(@"DEALLOC");
	[sprite release];
	[anm_move release];
	//	[anm_eat release];
	[anm_smash release];
	[go_center release];
	[go_center_no_delay release];
	[super dealloc];
	
}

- (void) final {
	[self stop];
	sprite.visible = NO;
	self.already_eat = NO; //drm
	[anm_eat release];
	[anm_eat_doctor release];
//	[anm_eat_freez release];
	[anm_eat_boom release];
	[anm_eat_roar release];
}

- (int) positionX {
	return sprite.position.x;
}

- (int) positionY {
	return sprite.position.y;
}

- (void) eatCallbackDoctor {
	if(mytype == DOCTOR_TYPE) {
		[Common instance].life += 30.0f;
		if([Common instance].life > 100)
			[Common instance].life = 100;
		//[game_sound play_medic];
	}
	
	if(mytype == METAL_TYPE) {
		[Common instance].metal = NO;
	}

	if(mytype == ROAR_TYPE) {
		[Common instance].roar = NO;
	}
	
	if(mytype == FREEZ_TYPE) {
		[Common instance].freez = NO;
	}
	
	if(mytype == BOOMER_TYPE) {
		[Common instance].boom = YES;
	}

	if(mytype == ELECTRO_TYPE) {
		[Common instance].electro = NO;
		[game_sound electro_stop];
	}
	
	doctoroff = YES;
}

- (void) eatCallback {
	if([Common instance].metal)
		return;
//	if(mytype == DOCTOR_TYPE)
//		[Common instance].life += 0.1f;
//	else
		[Common instance].life -= 0.1f;
	
	if([Common instance].life < 0)
		[Common instance].life = 0;

//	if([Common instance].life > 100)
//		[Common instance].life = 100;
	
	//if([Common instance].isEat && !game_sound.isPlayEat) [game_sound bug_attack_start];
	//if ([Common instance].isEat && ([Common instance].numEat > 1)) {[game_sound bugS_attack_start]; [game_sound bug_attack_stop];}
}

- (void) moveto: (int)duration position:(CGPoint)p {
	[sprite runAction:[CCMoveTo actionWithDuration:duration position:p]];
	self.already_eat = NO;
}

- (void) rotate: (CGPoint) p {
	self.already_eat = NO;
	float o = p.x - [sprite position].x;
	float a = p.y - [sprite position].y;
	if(o || a){
		float at = (float) CC_RADIANS_TO_DEGREES( atanf( o/a) );
		if( a < 0 ) {
			if(  o < 0 )
				at = 180 + abs(at);
			else
				at = 180 - abs(at);	
		}
		
		[sprite runAction: [CCRotateTo actionWithDuration:0.08 angle: at]];
	}
}

- (BOOL) actionsnumber {
	return [sprite numberOfRunningActions];
}

- (void) startEat {
	if(isSmashed || self.already_eat || ease || frozen || roared)
		return;

	[sprite stopAllActions];
	[self rotate:ccp(APPLE_X, APPLE_Y)];
	//[game_sound bug_attack_stop]; //drm
	//[game_sound bugS_attack_stop]; //drm	
	//[game_sound bug_step_stop]; //drm		

	if(!doctoroff && (mytype == METAL_TYPE)){
		[Common instance].metal = YES;
		[game_sound play_metal];}

	if(!doctoroff && (mytype == FREEZ_TYPE)){
		[Common instance].freez = YES;
		[game_sound play_frize];}

	if(!doctoroff && (mytype == ROAR_TYPE))
		[Common instance].roar = YES;

	if(!doctoroff && (mytype == ELECTRO_TYPE)){
		[Common instance].electro = YES;
		[game_sound electro_start];}

	if(!doctoroff && (mytype == DOCTOR_TYPE)){//drm
		[game_sound play_medic];}
	
	if((mytype == DOCTOR_TYPE) || (mytype == METAL_TYPE) || (mytype == FREEZ_TYPE)/*||(mytype == ELECTRO_TYPE)*/)
		[sprite runAction:anm_eat_doctor];
	else
		if(!doctoroff && (mytype == BOOMER_TYPE)){
			[sprite runAction:anm_eat_boom];
			[game_sound play_bomb];
		}
		else
			if(!doctoroff && ((mytype == ROAR_TYPE)||(mytype == ELECTRO_TYPE))){
				[sprite runAction:anm_eat_roar];
				//[game_sound play_roar];
			}
			else
				[sprite runAction:anm_eat];
	//[game_sound bug_attack_start];  //drm
	self.already_eat = YES; //drm
}

- (void) start {
	if(frozen || isSmashed)
		return;
	[self stop];
	//NSLog(@"Started");
	if(waitstart)
		[Common instance].bugsonscreen++;
	
	self.already_eat = NO; //drm

	
	CGPoint p1 = ccp(0, 0);
	if([Common instance].roar && (mytype < DOCTOR_TYPE)) {
		roared = YES;
		int x1 = APPLE_X;
		int x2 = sprite.position.x;
		int y1 = APPLE_Y;
		int y2 = sprite.position.y;
		if(x1 == x2) {
			if(y1 < y2)
				p1 = ccp(x1, 380);
			else
				p1 = ccp(x1, -20);
		}
		else {
			//double b = (y2 - y1) / (x2 - x1);
			int A = y1 - y2;
			int B = -(x1 - x2);
			int C = -(A * x1 + B * y1);
			int A1 = y1 - 360;
			int B1 = -(x1 - 0);
			int C1 = -(A1 * 0 + B1 * 360);
			int A2 = y1 - 0;
			int B2 = -(x1 - 0);
			int C2 = -(A2 * 0 + B2 * 0);
			int b1 = (A1 * x2) + (B1 * y2) + C1;
			int b2 = (A2 * x2) + (B2 * y2) + C2;
			if((b1 <= 0) && (b2 <= 0)) {
				p1 = ccp((-B * 410 - C) / A, 410);
			}
			if((b1 >= 0) && (b2 >= 0)) {
				p1 = ccp((-B * (-50) - C) / A, -50);
			}
			if((b1 >= 0) && (b2 <= 0)) {
				p1 = ccp(-50, (-A * (-50) - C) / B);
			}
			if((b1 <= 0) && (b2 >= 0)) {
				p1 = ccp(530, (-A * 530 - C) / B);
			}
			
		}
		id move = [CCMoveTo actionWithDuration:mydelay position:p1];
		[sprite runAction:[[move copy] autorelease]];
	
	}
	else {
		roared = NO;
		p1 = ccp(APPLE_X, APPLE_Y);
		[sprite runAction:waitstart?go_center:go_center_no_delay];
	}		
	
	waitstart = NO;
	
//	[sprite runAction:go_center];
	[self rotate:p1/*ccp(APPLE_X, APPLE_Y)*/];
	[sprite runAction:anm_move];
	//[game_sound bug_attack_stop];
	//if([self onScreen])
	//[game_sound bug_step_start];   //drm
}

- (void) easeCallback {
	
	if((sprite.position.x < -20) || (sprite.position.y < -20) || (sprite.position.x > 500) || (sprite.position.y > 340))
		life--;
	
	//[sprite stopAllActions];
	
	[sprite runAction:anm_move];
	[self rotate:ccp(APPLE_X, APPLE_Y)];	
	[sprite runAction:go_center_no_delay];
	
	ease = NO;
	//[game_sound bug_step_start];   //drm
	if (![Common instance].isEat && [Common instance].numEat <= 1)	
	{
		[game_sound bug_attack_stop]; //drm
		[game_sound bugS_attack_stop]; //drm	
	}
	self.already_eat = NO; //drm	
}

- (void) setPosition: (CGPoint) p {
	sprite.position = p;
}

- (void) start_no_delay: (CGPoint) p {
	if(frozen || isSmashed)
		return;
	
	CGPoint p1 = ccp(0, 0);
	if((p.x == -500) && (p.y == -500)) {
		int x1 = APPLE_X;
		int x2 = sprite.position.x;
		int y1 = APPLE_Y;
		int y2 = sprite.position.y;
		if(x1 == x2) {
			if(y1 < y2)
				p1 = ccp(x1, 360);
			else
				p1 = ccp(x1, 0);
		}
		else {
			//double b = (y2 - y1) / (x2 - x1);
			int A = y1 - y2;
			int B = -(x1 - x2);
			int C = -(A * x1 + B * y1);
			int A1 = y1 - 360;
			int B1 = -(x1 - 0);
			int C1 = -(A1 * 0 + B1 * 360);
			int A2 = y1 - 0;
			int B2 = -(x1 - 0);
			int C2 = -(A2 * 0 + B2 * 0);
			int b1 = (A1 * x2) + (B1 * y2) + C1;
			int b2 = (A2 * x2) + (B2 * y2) + C2;
			if((b1 <= 0) && (b2 <= 0)) {
				p1 = ccp((-B * 360 - C) / A, 360);
			}
			if((b1 >= 0) && (b2 >= 0)) {
				p1 = ccp((-B * 0 - C) / A, 0);
			}
			if((b1 >= 0) && (b2 <= 0)) {
				p1 = ccp(0, (-A * 0 - C) / B);
			}
			if((b1 <= 0) && (b2 >= 0)) {
				p1 = ccp(480, (-A * 480 - C) / B);
			}
			
		}
	//	p1 = ccp(startX, startY);
	}
	else
		p1 = p;
	ease = YES;
	[sprite stopAllActions];
	
	if(mytype == METAL_TYPE) {
		[Common instance].metal = NO;
	}
	
	if(mytype == ROAR_TYPE) {
		[Common instance].roar = NO;
	}
	
	if(mytype == FREEZ_TYPE) {
		[Common instance].freez = NO;
	}
		
	if(mytype == ELECTRO_TYPE) {
		[Common instance].electro = NO;
	}
	
	
	if (![Common instance].isEat && [Common instance].numEat <= 1)
	{
		[game_sound bug_attack_stop]; //drm
		[game_sound bugS_attack_stop]; //drm		
	}
	//[game_sound bug_step_stop]; //drm		
	id move = [CCMoveTo actionWithDuration:0.3f position:p1];
	id move_ease = [CCSequence actions:
					[CCEaseOut actionWithAction:[[move copy] autorelease] rate:3.0f],
					[CCCallFuncN actionWithTarget:self selector:@selector(easeCallback)],
					nil];
	
	[sprite runAction:move_ease];
	self.already_eat = NO; //drm	
	//[game_sound bug_step_start];   //drm	
}

- (void) stop {
	[sprite stopAllActions];
	self.already_eat = NO; //drm	
	if([Common instance].allSmashed && game_sound.isPlayStep)
		[game_sound bug_step_stop];    //drm
	if (![Common instance].isEat && [Common instance].numEat <= 1)
	{
		[game_sound bug_attack_stop];  //drm
		[game_sound bugS_attack_stop]; //drm		
	}
}

//- (void) hide {
//	sprite.visible = NO;
//	isSmashed = YES;
//}

- (CGRect) getRect {
	//	return CGRectMake( sprite.position.x -  sprite.textureRect.size.width * 1.5, sprite.position.y - sprite.textureRect.size.height * 1.5, sprite.textureRect.size.width*3, sprite.textureRect.size.height*3);
	return CGRectMake( sprite.position.x -  35, sprite.position.y - 35, 70, 70);
}

- (BOOL) onScreen {
	if((sprite.position.x > 0) && (sprite.position.x < 480) && (sprite.position.y > 0) && (sprite.position.y < 320))
		return TRUE;
	return FALSE;
}

- (BOOL) isSmashed {
	return isSmashed;
}

- (void) unfreez {
	//[sprite stopAllActions];
	frozen = NO;
	if(isSmashed)
		return;	
	[self start_no_delay:ccp(sprite.position.x, sprite.position.y)];
}

- (void) freez {
	//[sprite stopAllActions];
	if(frozen || isSmashed)
		return;
	frozen = YES;
	self.already_eat = NO;
	[self stop];
	if(!doctoroff)
		sprite.textureRect = freez;
}
- (BOOL) isSpec {
	return (mytype >= DOCTOR_TYPE);
}

- (void) smash {
	//NSLog(@"smash");
	if(isSmashed)
		return;
	[self stop];
	[Common instance].bugsonscreen--;
	
	if(!doctoroff)
		sprite.textureRect = smash;
		
	if((mytype > DOCTOR_TYPE) && (mytype != BOOMER_TYPE))
		[self eatCallbackDoctor];

	doctoroff = NO;
	
	[sprite runAction:anm_smash];
	isSmashed = YES;
	self.already_eat = NO; //drm	
	[game_sound bug_dead];       //drm
	if([Common instance].allSmashed && game_sound.isPlayStep)
		[game_sound bug_step_stop];    //drm	
	//	[Common instance].supergun += 5;
}

@end
