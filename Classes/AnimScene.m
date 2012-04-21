//
//  AnimScene.m
//  Beetles
//
//  Created by вадим on 6/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AnimScene.h"
#import "GameScene1.h"
#import "Common.h"

@implementation AnimScene
- (id) init{
	self = [super init];
	if(self !=nil) {
		[self addChild:[AnimLayer node] z:0];
	}
	return self;
}
@end

@implementation AnimLayer
- (id) init {
	self = [super init];
	if(self != nil) {
		
		isTouchEnabled = YES;
		
		//[[TextureMgr sharedTextureMgr] removeAllTextures];
		
		bg = [CCSprite spriteWithFile:@"Fon 1.png"];
		bg.position = ccp(240, 160);
		//bg.autoCenterFrames = YES;
		[self addChild:bg z:0];	

		CCSprite* sl = [CCSprite spriteWithFile:@"Samy verhniy sloy.png"];
		sl.position = ccp(240, 160);
		[self addChild:sl z:2];	

		mgr2 = [[CCSpriteBatchNode batchNodeWithFile:@"texture2.pvr" capacity:25]retain];
		[self addChild:mgr2 z:1];
	
		id anim1 = [CCAnimation animationWithName:@"anim1" delay:0.1f];
		for( int j = 1; j < 5; j++)
			//[anim1 addFrameWithFilename: [NSString stringWithFormat:@"clip01_%02d.png", j]];
			//[anim1 addFrameWithRect: [[Common instance] readPlist2:[NSString stringWithFormat:@"clip01_%02d.png", j]]];
			[anim1 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:[NSString stringWithFormat:@"clip01_%02d.png", j]]];

		anm1 = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anim1]]retain];
		
		
//		spr = [CCSprite spriteWithRect:[[Common instance]readPlist2: @"clip01_01.png"] spriteManager:mgr2];
		spr = [CCSprite spriteWithBatchNode:mgr2 rect:[[Common instance]readPlist2: @"clip01_01.png"]];
		//spr.autoCenterFrames = YES;
		spr.position = ccp(480, 160);
		//[self addChild:spr z:1];
		[mgr2 addChild:spr];
		[spr runAction:anm1];

		spr1 = [CCSprite spriteWithBatchNode:mgr2 rect:[[Common instance]readPlist2: @"shleyf01.png"]];
		spr1.position = ccp(300, 70);
		spr1.visible = NO;
		[mgr2 addChild:spr1];
		
		id anim2 = [CCAnimation animationWithName:@"anim2" delay:0.1f];
		for( int j = 1; j < 6; j++)
			//[anim2 addFrameWithFilename: [NSString stringWithFormat:@"clip02_%02d.png", j]];
			//[anim2 addFrameWithRect: [[Common instance] readPlist2:[NSString stringWithFormat:@"clip02_%02d.png", j]]];
			[anim2 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:[NSString stringWithFormat:@"clip02_%02d.png", j]]];

		id anim3 = [CCAnimation animationWithName:@"anim3" delay:0.1f];
		for( int j = 35; j < 41; j++)
			//[anim3 addFrameWithFilename: [NSString stringWithFormat:@"clip02_%02d.png", j]];
			//[anim3 addFrameWithRect: [[Common instance] readPlist2:[NSString stringWithFormat:@"clip02_%02d.png", j]]];
			[anim3 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:[NSString stringWithFormat:@"clip02_%02d.png", j]]];
		
		id anim4 = [CCAnimation animationWithName:@"anim4" delay:0.2f];
//		[anim4 addFrameWithFilename: @"ukus01.png"];
//		[anim4 addFrameWithFilename: @"ukus02.png"];

//		[anim4 addFrameWithRect: [[Common instance] readPlist2:@"ukus01.png"]];
		[anim4 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:@"ukus01.png"]];
//		[anim4 addFrameWithRect: [[Common instance] readPlist2:@"ukus02.png"]];
		[anim4 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:@"ukus02.png"]];


		id anim5 = [CCAnimation animationWithName:@"anim5" delay:0.3f];
		for( int j = 1; j < 5; j++)
			//[anim5 addFrameWithFilename: [NSString stringWithFormat:@"clip03_%02d.png", j]];
			//[anim5 addFrameWithRect: [[Common instance] readPlist2:[NSString stringWithFormat:@"clip03_%02d.png", j]]];
			[anim5 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:[NSString stringWithFormat:@"clip03_%02d.png", j]]];

		id anim6 = [CCAnimation animationWithName:@"anim6" delay:0.2f];
//		[anim6 addFrameWithFilename: @"clip04_01.png"];
//		[anim6 addFrameWithFilename: @"clip04_02.png"];

//		[anim6 addFrameWithRect: [[Common instance] readPlist2:@"clip04_01.png"]];
		[anim6 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:@"clip04_01.png"]];
//		[anim6 addFrameWithRect: [[Common instance] readPlist2:@"clip04_02.png"]];
		[anim6 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:@"clip04_02.png"]];
		
		anim7 = [[CCAnimation animationWithName:@"anim7" delay:0.2f]retain];
		for( int j = 1; j < 8; j++)
			//[anim7 addFrameWithFilename: [NSString stringWithFormat:@"shleyf%02d.png", j]];
			//[anim7 addFrameWithRect: [[Common instance] readPlist2:[NSString stringWithFormat:@"shleyf%02d.png", j]]];
			[anim7 addFrameWithTexture:mgr2.texture rect:[[Common instance] readPlist2:[NSString stringWithFormat:@"shleyf%02d.png", j]]];
		
		palec = [CCSprite spriteWithFile:@"Finger.png"];
		//palec.autoCenterFrames = YES;
		palec.position = ccp(280, 500);
		[self addChild:palec z:1];
		
//		palecanm = [[MoveTo actionWithDuration:3 position:ccp(180,140)]retain];
		
		id move1 = [CCSequence actions:
				    [CCCallFuncN actionWithTarget:self selector:@selector(movePlayCallback)],							
					[CCMoveTo actionWithDuration:3 position:ccp(190,140)],
					[CCCallFuncN actionWithTarget:self selector:@selector(moveStopCallback)],							
					[CCAnimate actionWithAnimation:anim2],					
					[CCAnimate actionWithAnimation:anim2],			
					//[CCAnimate actionWithAnimation:anim3],						
					[CCCallFuncN actionWithTarget:self selector:@selector(ukusPlayCallback)],	
					[CCAnimate actionWithAnimation:anim4],
					[CCAnimate actionWithAnimation:anim4],
					//[CCAnimate actionWithAnimation:anim4],
					[CCCallFuncN actionWithTarget:self selector:@selector(ukusCallback)],					
					[CCAnimate actionWithAnimation:anim4],
					//[CCAnimate actionWithAnimation:anim4],
					[CCCallFuncN actionWithTarget:self selector:@selector(palecCallback)],					
					[CCAnimate actionWithAnimation:anim5],
					[CCMoveTo actionWithDuration:0.001f position:ccp(230,110)],
					[CCAnimate actionWithAnimation:anim6],
					//[CCAnimate actionWithAnimation:anim7],
					[CCFadeOut actionWithDuration:0.001],
					nil];
		
		[spr runAction:move1];
		
	//[game_sound bug_attack_init];	
	}
	return self;
}
- (void) movePlayCallback {
	[game_sound anim_step_start];
}

- (void) moveStopCallback {
	[game_sound anim_step_stop];
}

- (void) ukusPlayCallback {
	[game_sound bug_attack_start];
} 

- (void) ukusCallback {
	[bg initWithFile:@"Fon 2.png"];
	bg.position = ccp(240, 160);
	//[game_sound bug_attack_start];
	
}
- (void) palecPlayCallback {
	[game_sound bug_dead];
	spr1.visible = YES;
	[spr1 runAction:[CCAnimate actionWithAnimation:anim7 restoreOriginalFrame:NO]];
}

- (void) palecCallback {
	[game_sound bug_attack_stop];
	[palec runAction:[CCSequence actions:
					  [CCMoveTo actionWithDuration:1.7f position:ccp(280,180)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(palecPlayCallback)],
					  [CCMoveTo actionWithDuration:1.7f position:ccp(700,180)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(endCallback)],						  
					nil]
	];
}

- (void) endCallback {
	[spr stopAllActions];
	[palec stopAllActions];
	[spr1 stopAllActions];
	spr1.visible = NO;
	[[CCDirector sharedDirector] replaceScene:[Common instance].menuscene];
}


- (void) dealloc {
	[anm1 release];
	[spr release];
	[spr1 release];
	[bg release];
	[mgr2 release];
	[palec release];
	[anim7 release];
	[super dealloc];
}

-(void)ccTouchesBegan:(NSSet* )touches withEvent:(UIEvent* )event{
//	GameScene1* ms = [GameScene1 node];
//	[[Director sharedDirector] replaceScene:ms];
	[self moveStopCallback];
	[game_sound bug_attack_stop];
	[spr stopAllActions];
	[palec stopAllActions];
	[[CCDirector sharedDirector] replaceScene:[Common instance].menuscene];
	
	return;// kEventHandled;
}
@end
