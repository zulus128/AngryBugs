//
//  GameScene1.m
//  Beetles
//
//  Created by вввв ввв on 5/15/09.
//  Copyright 2009 ввв. All rights reserved.
//

#import "GameScene1.h"
#import "Common.h"
#import "PauseScene.h"

//#import <mach/mach.h>
//#import <mach/mach_host.h>

//#import "SoundSupport.h" //drm
//SoundSupport* game_sound; //drm

@implementation GameScene1
- (id) init{
	self = [super init];
	if(self !=nil) {
		child = [GameLayer1 node];
		[self addChild:child z:2];
	}
	return self;
}

- (void) dealloc {
	
	[child release];
	[super dealloc];
}

- (void) load {
	
	[child load];
}

//- (void) runTimer {
//	[child runTimer];
//}

@end

@implementation GameLayer1

- (void) printmem {
/*	mach_port_t host_port;
	mach_msg_type_number_t host_size;
	vm_size_t pagesize;
	host_port = mach_host_self();
	host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
	host_page_size(host_port, &pagesize);
	vm_statistics_data_t vm_stat;
	if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
		NSLog(@"Failed to fetch vm statistics");
		//return 0;
	} else {
		natural_t mem_free = vm_stat.free_count * pagesize;		
		NSLog(@"Free memory: %.2fMB", mem_free/1024.0f/1024.0f);
	}*/
}

- (id) init {
	self = [super init];
	if(self !=nil) {
		
		isTouchEnabled = YES;
		
//		[self printmem];
		game_sound = [SoundSupport alloc]; //drm
		[game_sound s_init];
//		[self printmem];
		//[game_sound s_init];			   //drm
		//		NSLog(@"Init --- !!!");
		
		//Sprite* bu = [Sprite spriteWithFile:@"bubbles.png"];
		//bu.position = ccp(240, 298);
		//[self addChild:bu z:3];	
				
		//[[TextureMgr sharedTextureMgr] removeAllTextures];
		
		//bg = [Sprite spriteWithFile:@"Background1.pvr"];
		bg = [CCSprite spriteWithFile:@"Background.png"];
		bg.position = ccp(240, 160);
		[self addChild:bg z:0];		
		ll = [CCSprite spriteWithFile:@"live line & spots.png"];
		ll.position = ccp(240, 50);
		[self addChild:ll z:0];		
		sc = [CCSprite spriteWithFile:@"score.png"];
		sc.position = ccp(160, 305);
		[self addChild:sc z:3];	
		
//		mgr1 = [[AtlasSpriteManager spriteManagerWithFile:@"texture1.png" capacity:25]retain];
//		[self addChild:mgr1 z:1];
		mgr = [[CCSpriteBatchNode batchNodeWithFile:@"texture.png" capacity:250]retain];
		[self addChild:mgr z:1];
		mgr3 = [[CCSpriteSheet batchNodeWithFile:@"texture3.pvr" capacity:20]retain];
		[self addChild:mgr3 z:1];
		
//		sprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"Target01.png"] spriteManager:mgr];
		sprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"Target01.png"]];
		[mgr addChild:sprite];
		sprite.position = ccp(APPLE_X, APPLE_Y);
		
		target1 = [[Common instance]readPlist: @"Target01.png"];
		target2 = [[Common instance]readPlist: @"Target02.png"];
		target3 = [[Common instance]readPlist: @"Target03.png"];
		target4 = [[Common instance]readPlist: @"Target04.png"];
		target5 = [[Common instance]readPlist: @"Target05.png"];
		target6 = [[Common instance]readPlist: @"Target06.png"];
		target7 = [[Common instance]readPlist: @"Target07.png"];
		target8 = [[Common instance]readPlist: @"Target08.png"];
		target9 = [[Common instance]readPlist: @"Target09.png"];
		target10 = [[Common instance]readPlist: @"Target10.png"];
		mettarget1 = [[Common instance]readPlist: @"metapple01.png"];
		mettarget2 = [[Common instance]readPlist: @"metapple02.png"];
		mettarget3 = [[Common instance]readPlist: @"metapple03.png"];
		mettarget4 = [[Common instance]readPlist: @"metapple04.png"];
		mettarget5 = [[Common instance]readPlist: @"metapple05.png"];
		mettarget6 = [[Common instance]readPlist: @"metapple06.png"];
		mettarget7 = [[Common instance]readPlist: @"metapple07.png"];
		mettarget8 = [[Common instance]readPlist: @"metapple08.png"];
		mettarget9 = [[Common instance]readPlist: @"metapple09.png"];
		mettarget10 = [[Common instance]readPlist: @"metapple10.png"];

//		electro = [CCSprite spriteWithRect:[[Common instance]readPlist: @"elctroeffect01.png"] spriteManager:mgr];
		electro = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"elctroeffect01.png"]];
		//electro.autoCenterFrames = YES;
		electro.visible = NO;
		[mgr addChild:electro];
		electro.position = ccp(APPLE_X - 10, APPLE_Y - 10);

		id elec = [CCAnimation animationWithName:@"elec" delay:0.3f];
		for( int i = 1; i < 8; i++)
			//[elec addFrameWithRect: [[Common instance] readPlist:[NSString stringWithFormat:@"elctroeffect%02d.png", i]]];
			[elec addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:[NSString stringWithFormat:@"elctroeffect%02d.png", i]]];


		electro_anim =	[[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation: elec]]retain];
			
//		ranksprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"rank01.png"] spriteManager:mgr3];
		ranksprite = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist: @"rank01.png"]];
		//ranksprite.autoCenterFrames = YES;
		ranksprite.visible = NO;
		[mgr3 addChild:ranksprite];
		ranksprite.position = ccp(APPLE_X - 10, APPLE_Y - 10);

		rank_anim =	[[CCSequence actions:
					  [CCFadeIn actionWithDuration:0.3f],
					  [CCDelayTime actionWithDuration:2.0f],
					  [CCFadeOut actionWithDuration:0.3f],
					nil]retain];

		rank1 = [[Common instance]readPlist3: @"rank01.png"];
		rank2 = [[Common instance]readPlist3: @"rank03.png"];
		rank3 = [[Common instance]readPlist3: @"rank04.png"];
		rank4 = [[Common instance]readPlist3: @"rank05.png"];
		rank5 = [[Common instance]readPlist3: @"rank06.png"];
		rank6 = [[Common instance]readPlist3: @"rank07.png"];
		rank7 = [[Common instance]readPlist3: @"rank08.png"];
		rank8 = [[Common instance]readPlist3: @"rank09.png"];
		rank9 = [[Common instance]readPlist3: @"rank10.png"];
		rank10 = [[Common instance]readPlist3: @"rank11.png"];
		rank11 = [[Common instance]readPlist3: @"rank12.png"];
		rank12 = [[Common instance]readPlist3: @"rank13.png"];
		rank13 = [[Common instance]readPlist3: @"rank14.png"];
		rank14 = [[Common instance]readPlist3: @"rank15.png"];
		rank15 = [[Common instance]readPlist3: @"rank16.png"];
		
		
		id move = [CCMoveTo actionWithDuration:0.8 position:ccp(240,130)];
		zz = [[CCSequence actions:
			   [CCEaseOut actionWithAction:move rate:5.0f],
			   [CCCallFuncN actionWithTarget:self selector:@selector(zastMiddleCallback)],
			   nil]retain];
		
		id rev = [CCMoveTo actionWithDuration:0.4 position:ccp(240,-70)];
		iz = [[CCSequence actions:
			   [CCDelayTime actionWithDuration:1],
			   [CCCallFuncN actionWithTarget:self selector:@selector(zastMiddleCallback1)],			   
			   [CCEaseIn actionWithAction:rev rate:3.0f],
			   nil]retain];
		
		id move1 = [CCMoveTo actionWithDuration:0.8 position:ccp(240,190)];
		zz1 = [[CCEaseOut actionWithAction:move1 rate:5.0f]retain];
		id rev1 = [CCMoveTo actionWithDuration:0.4 position:ccp(240,390)];
		iz1 = [[CCSequence actions:
				[CCDelayTime actionWithDuration:1],
				[CCEaseIn actionWithAction:rev1 rate:3.0f],
				nil]retain];		
		
//		zast = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"zast2.png"] spriteManager:mgr3];
		zast = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"zast2.png"]];
		//zast.autoCenterFrames = YES;
		[mgr3 addChild:zast];
		zast.position = ccp(240, -70);
		
//		zast1 = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"zast1.png"] spriteManager:mgr3];
		zast1 = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"zast1.png"]];
		//zast1.autoCenterFrames = YES;
		[mgr3 addChild:zast1];
		zast1.position = ccp(240, 390);
		
		gover = [[CCSequence actions:
				  [CCScaleTo actionWithDuration:2 scale:1],
				  [CCCallFuncN actionWithTarget:self selector:@selector(goverCallback)],
				  nil]retain];
		
//		gosprite = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"gameover06.png"] spriteManager:mgr3];
		gosprite = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"gameover06.png"]];
		//gosprite.autoCenterFrames = YES;
		gosprite.visible = NO;
		gosprite.scale = 0.1;
		gosprite.position = ccp(240, 160);
		[mgr3 addChild:gosprite z:1];
		
//		psprite = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"Nenazhataya.png"] spriteManager:mgr3];
		psprite = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"Nenazhataya.png"]];
		[mgr3 addChild:psprite];
		psprite.position = ccp(410, 30);
		pause1 = [[Common instance]readPlist3: @"Nenazhataya.png"];
		pause2 = [[Common instance]readPlist3: @"Nazhataya.png"];
		
//		swsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"fork not aktiv.png"] spriteManager:mgr];
		swsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"fork not aktiv.png"]];
		[mgr addChild:swsprite];
		swsprite.position = ccp(70, 37);
		swatter1 = [[Common instance]readPlist: @"fork not aktiv.png"];
		swatter2 = [[Common instance]readPlist: @"fork.png"];
		swatter3 = [[Common instance]readPlist: @"spoon.png"];
		swatter4 = [[Common instance]readPlist: @"swatter.png"];
		swatter5 = [[Common instance]readPlist: @"2 forks.png"];
		swatter6 = [[Common instance]readPlist: @"2 spoons.png"];
		swatter7 = [[Common instance]readPlist: @"2 swatter.png"];
		swatter8 = [[Common instance]readPlist: @"4 swatter.png"];

		emptyButton = [[Common instance]readPlist: @"button_empty.png"];
//		medbuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		medbuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:medbuttonsprite];
		medbuttonsprite.position = ccp(MEDBUTTON_X, MEDBUTTON_Y);
		id meda = [CCAnimation animationWithName:@"meda" delay:0.5f];
//		[meda addFrameWithRect: [[Common instance] readPlist:@"medbutton01.png"]];
		[meda addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"medbutton01.png"]];
//		[meda addFrameWithRect: [[Common instance] readPlist:@"medbutton02.png"]];
		[meda addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"medbutton02.png"]];
		id meda1 = [CCAnimation animationWithName:@"meda1" delay:0.5f];
//		[meda1 addFrameWithRect: [[Common instance] readPlist:@"medbutton_notactiv.png"]];
		[meda1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"medbutton_notactiv.png"]];
		id meda2 = [CCAnimation animationWithName:@"meda2" delay:0.2f];
//		[meda2 addFrameWithRect: [[Common instance] readPlist:@"medbutton_pressed.png"]];
		[meda2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"medbutton_pressed.png"]];
//		[meda2 addFrameWithRect: [[Common instance] readPlist:@"medbutton_notactiv.png"]];
		[meda2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"medbutton_notactiv.png"]];
		medbuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(medbuttonCallback2)],
						   [CCAnimate actionWithAnimation:meda1 restoreOriginalFrame:NO],
						  [CCDelayTime actionWithDuration:MEDBUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(medbuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:meda restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:meda1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(medbuttonCallback2)],
						   nil]]retain];
		medbuttonanim1 = [[CCSequence actions:
						   [CCAnimate actionWithAnimation:meda2 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						   nil]retain];	

//		metbuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		metbuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:metbuttonsprite];
		metbuttonsprite.position = ccp(METBUTTON_X, METBUTTON_Y);
		id meta = [CCAnimation animationWithName:@"meta" delay:0.5f];
//		[meta addFrameWithRect: [[Common instance] readPlist:@"metbutton01.png"]];
		[meta addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"metbutton01.png"]];
//		[meta addFrameWithRect: [[Common instance] readPlist:@"metbutton02.png"]];
		[meta addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"metbutton02.png"]];
		id meta1 = [CCAnimation animationWithName:@"meta1" delay:0.5f];
//		[meta1 addFrameWithRect: [[Common instance] readPlist:@"metbutton_notactiv.png"]];
		[meta1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"metbutton_notactiv.png"]];
		id meta2 = [CCAnimation animationWithName:@"meta2" delay:0.2f];
//		[meta2 addFrameWithRect: [[Common instance] readPlist:@"metbutton_pressed.png"]];
		[meta2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"metbutton_pressed.png"]];
//		[meta2 addFrameWithRect: [[Common instance] readPlist:@"metbutton_notactiv.png"]];
		[meta2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"metbutton_notactiv.png"]];
		metbuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(metbuttonCallback2)],
						   [CCAnimate actionWithAnimation:meta1 restoreOriginalFrame:NO],
						   [CCDelayTime actionWithDuration:METBUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(metbuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:meta restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:meta1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(metbuttonCallback2)],
						   nil]]retain];
		metbuttonanim1 = [[CCSequence actions:
						   [CCAnimate actionWithAnimation:meta2 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						   nil]retain];	
		
//		roabuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		roabuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:roabuttonsprite];
		roabuttonsprite.position = ccp(ROABUTTON_X, ROABUTTON_Y);
		id mera = [CCAnimation animationWithName:@"mera" delay:0.5f];
//		[mera addFrameWithRect: [[Common instance] readPlist:@"roabutton01.png"]];
		[mera addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"roabutton01.png"]];
//		[mera addFrameWithRect: [[Common instance] readPlist:@"roabutton02.png"]];
		[mera addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"roabutton02.png"]];
		id mera1 = [CCAnimation animationWithName:@"mera1" delay:0.5f];
//		[mera1 addFrameWithRect: [[Common instance] readPlist:@"roabutton_notactiv.png"]];
		[mera1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"roabutton_notactiv.png"]];
		id mera2 = [CCAnimation animationWithName:@"mera2" delay:0.2f];
//		[mera2 addFrameWithRect: [[Common instance] readPlist:@"roabutton_pressed.png"]];
		[mera2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"roabutton_pressed.png"]];
//		[mera2 addFrameWithRect: [[Common instance] readPlist:@"roabutton_notactiv.png"]];
		[mera2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"roabutton_notactiv.png"]];
		roabuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(roabuttonCallback2)],
						   [CCAnimate actionWithAnimation:mera1 restoreOriginalFrame:NO],
						   [CCDelayTime actionWithDuration:ROABUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(roabuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:mera restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:mera1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(roabuttonCallback2)],
						   nil]]retain];
		roabuttonanim1 = [[CCSequence actions:
						   [CCAnimate actionWithAnimation:mera2 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						   nil]retain];	
		
//		frebuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		frebuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:frebuttonsprite];
		frebuttonsprite.position = ccp(FREBUTTON_X, FREBUTTON_Y);
		id mefa = [CCAnimation animationWithName:@"mefa" delay:0.5f];
//		[mefa addFrameWithRect: [[Common instance] readPlist:@"frebutton01.png"]];
		[mefa addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"frebutton01.png"]];
//		[mefa addFrameWithRect: [[Common instance] readPlist:@"frebutton02.png"]];
		[mefa addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"frebutton02.png"]];
		id mefa1 = [CCAnimation animationWithName:@"mefa1" delay:0.5f];
//		[mefa1 addFrameWithRect: [[Common instance] readPlist:@"frebutton_notactiv.png"]];
		[mefa1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"frebutton_notactiv.png"]];
		id mefa2 = [CCAnimation animationWithName:@"mefa2" delay:0.2f];
//		[mefa2 addFrameWithRect: [[Common instance] readPlist:@"frebutton_pressed.png"]];
		[mefa2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"frebutton_pressed.png"]];
//		[mefa2 addFrameWithRect: [[Common instance] readPlist:@"frebutton_notactiv.png"]];
		[mefa2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"frebutton_notactiv.png"]];
		frebuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(frebuttonCallback2)],
						   [CCAnimate actionWithAnimation:mefa1 restoreOriginalFrame:NO],
						   [CCDelayTime actionWithDuration:FREBUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(frebuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:mefa restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:mefa1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(frebuttonCallback2)],
						   nil]]retain];
		frebuttonanim1 = [[CCSequence actions:
						   [CCAnimate actionWithAnimation:mefa2 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						   nil]retain];	
		
//		boobuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		boobuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:boobuttonsprite];
		boobuttonsprite.position = ccp(BOOBUTTON_X, BOOBUTTON_Y);
		id meba = [CCAnimation animationWithName:@"meba" delay:0.5f];
//		[meba addFrameWithRect: [[Common instance] readPlist:@"boobutton01.png"]];
		[meba addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"boobutton01.png"]];
//		[meba addFrameWithRect: [[Common instance] readPlist:@"boobutton02.png"]];
		[meba addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"boobutton02.png"]];
		id meba1 = [CCAnimation animationWithName:@"meba1" delay:0.5f];
//		[meba1 addFrameWithRect: [[Common instance] readPlist:@"boobutton_notactiv.png"]];
		[meba1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"boobutton_notactiv.png"]];
		id meba2 = [CCAnimation animationWithName:@"meba2" delay:0.2f];
//		[meba2 addFrameWithRect: [[Common instance] readPlist:@"boobutton_pressed.png"]];
		[meba2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"boobutton_pressed.png"]];
//		[meba2 addFrameWithRect: [[Common instance] readPlist:@"boobutton_notactiv.png"]];
		[meba2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"boobutton_notactiv.png"]];
		boobuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(boobuttonCallback2)],
						   [CCAnimate actionWithAnimation:meba1 restoreOriginalFrame:NO],
						   [CCDelayTime actionWithDuration:BOOBUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(boobuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:meba restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:meba1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(boobuttonCallback2)],
						   nil]]retain];
		boobuttonanim1 = [[CCSequence actions:
						   [CCAnimate actionWithAnimation:meba2 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						   nil]retain];	
		
//		elebuttonsprite = [CCSprite spriteWithRect:[[Common instance]readPlist: @"button_empty.png"] spriteManager:mgr];
		elebuttonsprite = [CCSprite spriteWithBatchNode:mgr rect:[[Common instance]readPlist: @"button_empty.png"]];
		[mgr addChild:elebuttonsprite];
		elebuttonsprite.position = ccp(ELEBUTTON_X, ELEBUTTON_Y);
		id mela = [CCAnimation animationWithName:@"mela" delay:0.5f];
//		[mela addFrameWithRect: [[Common instance] readPlist:@"elebutton01.png"]];
		[mela addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"elebutton01.png"]];
//		[mela addFrameWithRect: [[Common instance] readPlist:@"elebutton02.png"]];
		[mela addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"elebutton02.png"]];
		id mela1 = [CCAnimation animationWithName:@"mela1" delay:0.5f];
//		[mela1 addFrameWithRect: [[Common instance] readPlist:@"elebutton_notactiv.png"]];
		[mela1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"elebutton_notactiv.png"]];
		id mela2 = [CCAnimation animationWithName:@"mela2" delay:0.2f];
//		[mela2 addFrameWithRect: [[Common instance] readPlist:@"elebutton_pressed.png"]];
		[mela2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"elebutton_pressed.png"]];
//		[mela2 addFrameWithRect: [[Common instance] readPlist:@"elebutton_notactiv.png"]];
		[mela2 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:@"elebutton_notactiv.png"]];
		elebuttonanim = [[CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFuncN actionWithTarget:self selector:@selector(elebuttonCallback2)],
						   [CCAnimate actionWithAnimation:mela1 restoreOriginalFrame:NO],
						   [CCDelayTime actionWithDuration:ELEBUTTON_DELAY],
						   [CCCallFuncN actionWithTarget:self selector:@selector(elebuttonCallback1)],
						   [CCRepeat actionWithAction: [CCAnimate actionWithAnimation:mela restoreOriginalFrame:YES] times:3],
						   [CCAnimate actionWithAnimation:mela1 restoreOriginalFrame:NO],
						   [CCCallFuncN actionWithTarget:self selector:@selector(elebuttonCallback2)],
						   nil]]retain];
		elebuttonanim1 = [[CCSequence actions:
						  [CCAnimate actionWithAnimation:mela2 restoreOriginalFrame:NO],
						  [CCCallFuncN actionWithTarget:self selector:@selector(stopSpecs)],
						  nil]retain];		
		
		NSString* str = [NSString stringWithFormat:@"%02d",0];
		levellab = [[CCLabelAtlas labelAtlasWithString:str charMapFile:@"zast_numbers.png" itemWidth:24 itemHeight:27 startCharMap:'0'] retain];
		levellab.position = ccp(220,115);
		levellab.visible = FALSE;		
		[self addChild:levellab z:5];

		str = [NSString stringWithFormat:@"%07d",0];
		scorelab = [[CCLabelAtlas labelAtlasWithString:str charMapFile:@"score_numbers.png" itemWidth:24 itemHeight:17 startCharMap:'0'] retain];
		scorelab.position = ccp(240,296);
		[self addChild:scorelab z:5];
		
		sline = [[LifeLine alloc]initWithLayerXYR:self x:162 y:20 rate:[Common instance].life];
		[sline retain];
		gline = [[SupergunLine alloc]initWithLayerXYR:self x:9 y:6 rate:[Common instance].supergun];
		[sline retain];
		
		for(int i = 0; i < BEETLE_TYPES_WITH_SPECIALS; i++) {		
			id anim = [CCAnimation animationWithName:[NSString stringWithFormat:@"move_bug%02d", i] delay:0.07f];
			for( int j = 1; j < 5; j++)
				//[anim addFrameWithRect: [[Common instance] readPlist:[NSString stringWithFormat:@"bug%02d_move%02d.png", i+1, j]]];
				[anim addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:[NSString stringWithFormat:@"bug%02d_move%02d.png", i+1, j]]];
			anm[i] = anim;
			[anm[i] retain];
			int n = 4;
			switch(i) {
				case METAL_TYPE:
				case ELECTRO_TYPE:
								n = 3; break;
				//case FREEZ_TYPE: n = 2; break;
				case ROAR_TYPE: n = 6; break;
			}
			id anim1 = [CCAnimation animationWithName:[NSString stringWithFormat:@"eat_bug%02d", i] delay:0.07f];
			for( int j = 1; j <= n; j++)
//				[anim1 addFrameWithRect: [[Common instance] readPlist:[NSString stringWithFormat:@"bug%02d_eat%02d.png", i+1, j]]];
				[anim1 addFrameWithTexture:mgr.texture rect:[[Common instance] readPlist:[NSString stringWithFormat:@"bug%02d_eat%02d.png", i+1, j]]];
			anm1[i] = anim1;
			[anm1[i] retain];
		}
		
		smashfactor = [[Common instance]getParams:@"Smash factor"];
		
		for(int i = 0; i < BEETLE_NUM_MAX; i++) {
			btl[i] = 0;
		}
//		medbtl = 0;
		
		pause = NO;
		swatter = NO;
		level = -1;//-1;
		lev = -1;
		
		medallowed = NO;
		medpressed = NO;
		doctorlevel = [[Common instance]getParams:@"Start level for doctor"];
		metallowed = NO;
		metpressed = NO;
		metlevel = [[Common instance]getParams:@"Start level for metal"];
		roaallowed = NO;
		roapressed = NO;
		roalevel = [[Common instance]getParams:@"Start level for roar"];
		freallowed = NO;
		frepressed = NO;
		frelevel = [[Common instance]getParams:@"Start level for freez"];
		eleallowed = NO;
		elepressed = NO;
		elelevel = [[Common instance]getParams:@"Start level for electro"];
		booallowed = NO;
		boopressed = NO;
		boolevel = [[Common instance]getParams:@"Start level for boom"];

		medrect = [[Common instance]readPlist: @"medbutton_notactiv.png"];;
		metrect = [[Common instance]readPlist: @"metbutton_notactiv.png"];;
		frerect = [[Common instance]readPlist: @"frebutton_notactiv.png"];;
		boorect = [[Common instance]readPlist: @"boobutton_notactiv.png"];;
		roarect = [[Common instance]readPlist: @"roabutton_notactiv.png"];;
		elerect = [[Common instance]readPlist: @"elebutton_notactiv.png"];;
		
		[self printmem];
		
		forkRect = [[Common instance]readPlist3: @"fork_up.png"];
		for( int i = 0; i < DIRKA_CNT; i++) {
//			dirka[i] = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"fork_hole.png"] spriteManager:mgr3];
			dirka[i] = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"fork_hole.png"]];
			dirka[i].visible = NO;
			[mgr3 addChild:dirka[i]];
		}
		dirka[0].position = ccp(FORKDIRKA1_X, FORKDIRKA1_Y);
		dirka[1].position = ccp(FORKDIRKA2_X, FORKDIRKA2_Y);
		dirka[2].position = ccp(FORKDIRKA3_X, FORKDIRKA3_Y);
		dirka[3].position = ccp(FORKDIRKA4_X, FORKDIRKA4_Y);
		dirka[4].position = ccp(FORKDIRKA5_X, FORKDIRKA5_Y);
		dirka[5].position = ccp(FORKDIRKA6_X, FORKDIRKA6_Y);
		dirka[6].position = ccp(FORKDIRKA7_X, FORKDIRKA7_Y);
		dirka[7].position = ccp(FORKDIRKA8_X, FORKDIRKA8_Y);
		dirka[8].position = ccp(FORKDIRKA9_X, FORKDIRKA9_Y);
		
		fork_anim =[[CCSequence actions: 
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_0)],
					 [CCMoveTo actionWithDuration:0.08f position:ccp(FORKDIRKA1_X, FORKDIRKA1_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_1)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA2_X, FORKDIRKA2_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_2)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA3_X, FORKDIRKA3_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_3)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA4_X, FORKDIRKA4_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_4)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA5_X, FORKDIRKA5_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_5)],						 
					 [CCMoveTo actionWithDuration:0.13f position:ccp(240,400)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback)],	
					 nil]retain];
		
		spoonRect = [[Common instance]readPlist3: @"spoon.png"];
		for( int i = 0; i < SPOONSHLEP_CNT; i++) {
//			spoonshlep[i] = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"spoon_shlepok.png"] spriteManager:mgr3];
			spoonshlep[i] = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"spoon_shlepok.png"]];
			spoonshlep[i].visible = NO;
			[mgr3 addChild:spoonshlep[i]];
		}
		spoonshlep[0].position = ccp(SPOONSHLEP1_X, SPOONSHLEP1_Y);
		spoonshlep[1].position = ccp(SPOONSHLEP2_X, SPOONSHLEP2_Y);
		spoonshlep[2].position = ccp(SPOONSHLEP3_X, SPOONSHLEP3_Y);
		spoonshlep[3].position = ccp(SPOONSHLEP4_X, SPOONSHLEP4_Y);
		
		spoonshlep[4].position = ccp(SPOONSHLEP2_1_X, SPOONSHLEP2_1_Y);
		spoonshlep[5].position = ccp(SPOONSHLEP2_2_X, SPOONSHLEP2_2_Y);
		spoonshlep[6].position = ccp(SPOONSHLEP2_3_X, SPOONSHLEP2_3_Y);
		spoonshlep[7].position = ccp(SPOONSHLEP2_4_X, SPOONSHLEP2_4_Y);
		spoonshlep[8].position = ccp(SPOONSHLEP2_5_X, SPOONSHLEP2_5_Y);
		spoonshlep[9].position = ccp(SPOONSHLEP2_6_X, SPOONSHLEP2_6_Y);
		
		spoon_anim =[[CCSequence actions: 
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_0)],
					 [CCMoveTo actionWithDuration:0.1f position:ccp(SPOONSHLEP1_X, SPOONSHLEP1_Y + 60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_1)],	
					 [CCMoveTo actionWithDuration:0.2f position:ccp(SPOONSHLEP2_X, SPOONSHLEP2_Y + 60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_2)],	
					 [CCMoveTo actionWithDuration:0.2f position:ccp(SPOONSHLEP3_X, SPOONSHLEP3_Y + 60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_3)],	
					 [CCMoveTo actionWithDuration:0.2f position:ccp(SPOONSHLEP4_X, SPOONSHLEP4_Y + 60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_4)],	
					 [CCMoveTo actionWithDuration:0.2f position:ccp(240,450)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback)],	
					 nil]retain];
				

		swatRect = [[Common instance]readPlist3: @"swat01.png"];
		id swa = [CCAnimation animationWithName:@"swatanim" delay:0.1f];
		for( int i = 1; i < 5; i++)
			//[swa addFrameWithRect: [[Common instance] readPlist3:[NSString stringWithFormat:@"swat%02d.png", i]]];
			[swa addFrameWithTexture:mgr3.texture rect:[[Common instance] readPlist3:[NSString stringWithFormat:@"swat%02d.png", i]]];
		swat_anim =[[CCSequence actions: 
					 [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback_0)],
					 [CCAnimate actionWithAnimation: swa],
					 [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback)],	
					 nil]retain];

		swat_anim2 =[[CCSequence actions: 
					 [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback_0_1)],
					 [CCAnimate actionWithAnimation: swa],
					 [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback2)],	
					 nil]retain];

		swat_anim4 =[[CCSequence actions: 
					  [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback_0_2)],
					  [CCAnimate actionWithAnimation: swa],
					  [CCCallFuncN actionWithTarget:self selector:@selector(swatCallback4)],	
					  nil]retain];
		
		swat_anim2_1 =[[CCAnimate actionWithAnimation: swa]retain];
		swat_anim4_1 =[[CCAnimate actionWithAnimation: swa]retain];
		swat_anim4_2 =[[CCAnimate actionWithAnimation: swa]retain];
		
		fork_anim2 =[[CCSequence actions: 
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_0)],
					 [CCMoveTo actionWithDuration:0.08f position:ccp(FORKDIRKA1_X, FORKDIRKA1_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_1)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA2_X, FORKDIRKA2_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_2)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA3_X, FORKDIRKA3_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_3)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA4_X, FORKDIRKA4_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_4)],	
					 [CCMoveTo actionWithDuration:0.13f position:ccp(FORKDIRKA5_X, FORKDIRKA5_Y + forkRect.size.height/2)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_5)],						 
					 [CCMoveTo actionWithDuration:0.13f position:ccp(240,450)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback2)],	
					 nil]retain];

		fork_anim2_1 =[[CCSequence actions: 
					  [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_0_1)],
					  [CCMoveTo actionWithDuration:0.08f position:ccp(FORKDIRKA6_X, FORKDIRKA6_Y + forkRect.size.height/2)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_6)],	
					  [CCMoveTo actionWithDuration:0.18f position:ccp(FORKDIRKA7_X, FORKDIRKA7_Y + forkRect.size.height/2)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_7)],	
					  [CCMoveTo actionWithDuration:0.18f position:ccp(FORKDIRKA8_X, FORKDIRKA8_Y + forkRect.size.height/2)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_8)],	
					  [CCMoveTo actionWithDuration:0.18f position:ccp(FORKDIRKA9_X, FORKDIRKA9_Y + forkRect.size.height/2)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(forkCallback_9)],	
					  [CCMoveTo actionWithDuration:0.2f position:ccp(240,450)],
					  nil]retain];

		spoon_anim2 =[[CCSequence actions: 
					  [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback_0_1)],
					  [CCMoveTo actionWithDuration:0.1f position:ccp(SPOONSHLEP2_1_X - 60, SPOONSHLEP2_1_Y)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_1)],	
					  [CCMoveTo actionWithDuration:0.2f position:ccp(SPOONSHLEP2_2_X - 60, SPOONSHLEP2_2_Y)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_2)],	
					  [CCMoveTo actionWithDuration:0.2f position:ccp(SPOONSHLEP2_3_X - 60, SPOONSHLEP2_3_Y)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_3)],	
					  [CCMoveTo actionWithDuration:0.2f position:ccp(240,450)],
					  [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2)],	
					  nil]retain];

		spoon_anim2_1 =[[CCSequence actions: 
					   [CCMoveTo actionWithDuration:0.15f position:ccp(SPOONSHLEP2_4_X + 60, SPOONSHLEP2_4_Y)],
					   [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_4)],	
					   [CCMoveTo actionWithDuration:0.25f position:ccp(SPOONSHLEP2_5_X + 60, SPOONSHLEP2_5_Y)],
					   [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_5)],	
					   [CCMoveTo actionWithDuration:0.1f position:ccp(SPOONSHLEP2_6_X + 60, SPOONSHLEP2_6_Y)],
					   [CCCallFuncN actionWithTarget:self selector:@selector(spoonCallback2_6)],	
					   [CCMoveTo actionWithDuration:0.2f position:ccp(240,450)],
					   nil]retain];

//		swanimsprite = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"fork_up.png"] spriteManager:mgr3];
		swanimsprite = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"fork_up.png"]];
		swanimsprite.position = ccp(240, 460);
		swanimsprite.visible = NO;
		[mgr3 addChild:swanimsprite];
//		swanimsprite1 = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"fork_up.png"] spriteManager:mgr3];
		swanimsprite1 = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"fork_up.png"]];
		swanimsprite1.position = ccp(240, 460);
		swanimsprite1.visible = NO;
		[mgr3 addChild:swanimsprite1];
//		swanimsprite2 = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"swat01.png"] spriteManager:mgr3];
		swanimsprite2 = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"swat01.png"]];
		swanimsprite2.position = ccp(240, 460);
		swanimsprite2.visible = NO;
		[mgr3 addChild:swanimsprite2];
//		swanimsprite3 = [CCSprite spriteWithRect:[[Common instance]readPlist3: @"swat01.png"] spriteManager:mgr3];
		swanimsprite3 = [CCSprite spriteWithBatchNode:mgr3 rect:[[Common instance]readPlist3: @"swat01.png"]];
		swanimsprite3.position = ccp(240, 460);
		swanimsprite3.visible = NO;
		[mgr3 addChild:swanimsprite3];
		
		[self printmem];

		[self beginLevel];
	}
	return self;
}

- (void) swatCallback_0 {
	swanimsprite.position = ccp(APPLE_X - 55, APPLE_Y - 70);
	swanimsprite.textureRect = swatRect;
	swanimsprite.visible = YES;
	swanimsprite.rotation = 0;
}

- (void) swatCallback_0_1 {
	swanimsprite.position = ccp(APPLE_X - 200, APPLE_Y - 70);
	swanimsprite.textureRect = swatRect;
	swanimsprite.visible = YES;
	swanimsprite.rotation = 0;
	swanimsprite1.position = ccp(APPLE_X + 80, APPLE_Y - 70);
	swanimsprite1.textureRect = swatRect;
	swanimsprite1.visible = YES;
	swanimsprite1.rotation = 0;
}

- (void) swatCallback_0_2 {
	swanimsprite.position = ccp(APPLE_X - 190, APPLE_Y - 80);
	swanimsprite.textureRect = swatRect;
	swanimsprite.visible = YES;
	swanimsprite.rotation = 45;
	swanimsprite1.position = ccp(APPLE_X + 150, APPLE_Y + 70);
	swanimsprite1.textureRect = swatRect;
	swanimsprite1.visible = YES;
	swanimsprite1.rotation = -135;
	swanimsprite2.position = ccp(APPLE_X + 130, APPLE_Y - 100);
	swanimsprite2.visible = YES;
	swanimsprite2.rotation = -45;
	swanimsprite3.position = ccp(APPLE_X - 140, APPLE_Y + 110);
	swanimsprite3.visible = YES;
	swanimsprite3.rotation = 135;
}

- (void) swatCallback {
	swatter = NO;
	swanimsprite.visible = NO;
	int x2 = APPLE_X;
	int y2 = APPLE_Y;
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++)
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			int x1 = btl[i].positionX;
			int y1 = btl[i].positionY;
			double d = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
			if(d < 70)		
				[self doSmash:i swatter:YES spec:[btl[i] isSpec]];
		}
}

- (void) swatCallback2 {
	swatter = NO;
	swanimsprite.visible = NO;
	swanimsprite1.visible = NO;
	int x2 = APPLE_X;
	int y2 = APPLE_Y;
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++)
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			int x1 = btl[i].positionX;
			int y1 = btl[i].positionY;
			double d = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
			if(d < 140)		
				[self doSmash:i swatter:YES spec:[btl[i] isSpec]];
		}
}

- (void) swatCallback4 {
	swatter = NO;
	swanimsprite.visible = NO;
	swanimsprite1.visible = NO;
	swanimsprite2.visible = NO;
	swanimsprite3.visible = NO;
	
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++)
		if(![btl[i] isSmashed] && [btl[i] onScreen])
			[self doSmash:i swatter:YES spec:[btl[i] isSpec]];
}

- (void) spoonCallback_0 {
	swanimsprite.position = ccp(240,400);
	swanimsprite.textureRect = spoonRect;
	swanimsprite.visible = YES;
	swanimsprite.rotation = 0;
}

- (void) spoonCallback_0_1 {
	swanimsprite1.position = ccp(240,400);
	swanimsprite1.textureRect = spoonRect;
	swanimsprite.textureRect = spoonRect;
	swanimsprite.rotation = -90;
	swanimsprite1.rotation = 90;
	swanimsprite1.visible = YES;
}

- (void) spoonCallback_1 {
	spoonshlep[0].visible = YES;
}
- (void) spoonCallback_2 {
	spoonshlep[1].visible = YES;
	spoonshlep[0].visible = NO;
}
- (void) spoonCallback_3 {
	spoonshlep[2].visible = YES;
	spoonshlep[1].visible = NO;
}
- (void) spoonCallback_4 {
	spoonshlep[3].visible = YES;
	spoonshlep[2].visible = NO;
}

- (void) spoonCallback2_1 {
		spoonshlep[4].visible = YES;
}
- (void) spoonCallback2_2 {
	spoonshlep[5].visible = YES;
	spoonshlep[4].visible = NO;
}
- (void) spoonCallback2_3 {
	spoonshlep[6].visible = YES;
	spoonshlep[5].visible = NO;
}
- (void) spoonCallback2_4 {
	spoonshlep[7].visible = YES;
}
- (void) spoonCallback2_5 {
	spoonshlep[8].visible = YES;
	spoonshlep[7].visible = NO;
}
- (void) spoonCallback2_6 {
	spoonshlep[9].visible = YES;
	spoonshlep[8].visible = NO;
}

- (void) spoonCallback {
	spoonshlep[3].visible = NO;
	swatter = NO;
	swanimsprite.visible = NO;
	int x2 = APPLE_X;
	int y2 = APPLE_Y;
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++)
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			int y1 = btl[i].positionY;
			if(y1 > 200)
				continue;
			int x1 = btl[i].positionX;
			double d = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
			if(d < 120)		
				[self doSmash:i swatter:YES spec:[btl[i] isSpec]];
		}
//	for( int i = 0; i < SPOONSHLEP_CNT; i++)
//		spoonshlep[i].visible = NO;
}

- (void) spoonCallback2 {
	spoonshlep[6].visible = NO;
	spoonshlep[9].visible = NO;
	swatter = NO;
	swanimsprite.visible = NO;
	swanimsprite1.visible = NO;
	int x2 = APPLE_X;
	int y2 = APPLE_Y;
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++)
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			int y1 = btl[i].positionY;
			//if(y1 > 200)
			//	continue;
			int x1 = btl[i].positionX;
			double d = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
			if(d < 150)		
				[self doSmash:i swatter:YES spec:[btl[i] isSpec]];
		}
}

- (void) forkCallback_0 {
	swanimsprite.position = ccp(240,450);
	swanimsprite.textureRect = forkRect;
	swanimsprite.visible = YES;
	swanimsprite.rotation = 0;
}

- (void) forkCallback_0_1 {
	swanimsprite1.position = ccp(240,450);
	swanimsprite1.textureRect = forkRect;
	swanimsprite1.visible = YES;
	swanimsprite.rotation = 0;
	swanimsprite1.rotation = 0;
}

- (void) forkCallback_1 {
	dirka[0].visible = YES;
}
- (void) forkCallback_2 {
	dirka[1].visible = YES;
}
- (void) forkCallback_3 {
	dirka[2].visible = YES;
}
- (void) forkCallback_4 {
	dirka[3].visible = YES;
}
- (void) forkCallback_5 {
	dirka[4].visible = YES;
}
- (void) forkCallback_6 {
	dirka[5].visible = YES;
}
- (void) forkCallback_7 {
	dirka[6].visible = YES;
}
- (void) forkCallback_8 {
	dirka[7].visible = YES;
}
- (void) forkCallback_9 {
	dirka[8].visible = YES;
}

- (void) forkCallback {
	swatter = NO;
	swanimsprite.visible = NO;
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++) 
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			
			int t = CCRANDOM_0_1() * 100;
			if (t > 35)
				continue;
			
			[self doSmash:i swatter:YES spec:[btl[i] isSpec]];	
		}
	
	for( int i = 0; i < DIRKA_CNT; i++)
		dirka[i].visible = NO;
}

- (void) forkCallback2 {
	swatter = NO;
	swanimsprite.visible = NO;
	swanimsprite1.visible = NO;
	
	for(int i = 0; i < levelmaxbugs + SPECIALS_NUM; i++) 
		if(![btl[i] isSmashed] && [btl[i] onScreen]) {
			
			int t = CCRANDOM_0_1() * 100;
			if (t > 70)
				continue;
			
			[self doSmash:i swatter:YES spec:[btl[i] isSpec]];	
		}

	for( int i = 0; i < DIRKA_CNT; i++)
		dirka[i].visible = NO;

}

- (void) medbuttonCallback1 {
	medallowed = YES;
}

- (void) medbuttonCallback2 {
	medallowed = NO;
}

- (void) metbuttonCallback1 {
	metallowed = YES;
}

- (void) metbuttonCallback2 {
	metallowed = NO;
}

- (void) roabuttonCallback1 {
	roaallowed = YES;
}

- (void) roabuttonCallback2 {
	roaallowed = NO;
}

- (void) frebuttonCallback1 {
	freallowed = YES;
}

- (void) frebuttonCallback2 {
	freallowed = NO;
}

- (void) boobuttonCallback1 {
	booallowed = YES;
}

- (void) boobuttonCallback2 {
	booallowed = NO;
}

- (void) elebuttonCallback1 {
	eleallowed = YES;
}

- (void) elebuttonCallback2 {
	eleallowed = NO;
}

- (void) goverCallback {
	[game_sound play_gameover];		 
	for(int i = 0; i < (levelmaxbugs + SPECIALS_NUM); i++)
		if(btl[i]) {
			[btl[i] final];
			//[btl[i] stop];
			[btl[i] release];
			btl[i] = 0;
		}
/*	if(medbtl) {
		[medbtl final];
		[medbtl release];
		medbtl = 0;
	}*/
	[bg runAction:[CCFadeOut actionWithDuration:1]];
	[ll runAction:[CCFadeOut actionWithDuration:1]];
	[sc runAction:[CCSequence actions:
				   [CCFadeOut actionWithDuration:2],
				   [CCCallFuncN actionWithTarget:self selector:@selector(goverCallback1)],
				   nil]
	 ];
}

- (void) goverCallback1 {
	level = -1;
	[Common instance].scorescene = [ScoreScene node];	
	[[Common instance]resetGame];	
	bg.opacity = 255;
	ll.opacity = 255;
	sc.opacity = 255;
	gosprite.visible = NO;
	//[[Director sharedDirector] replaceScene:[Common instance].menuscene];
	[game_sound bug_step_stop];
	[game_sound bugS_attack_stop];
	[game_sound bug_attack_stop];
	[game_sound stopBGmusic];
	NSString* str1 = [NSString stringWithFormat:@"%07d",0];
	[scorelab setString:str1];
	[[CCDirector sharedDirector] replaceScene:[Common instance].scorescene]; //drm	

}

- (void) pauseCallback:(id) sender {
	PauseScene* ps = [PauseScene node];
	[[CCDirector sharedDirector] pushScene:ps];
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
		[game_sound click_pause];
	[game_sound bug_muteON];
	[game_sound musicOFF];
}

- (void) zastMiddleCallback {
	NSString* str = [NSString stringWithFormat:@"%02d", level + 1];
	[levellab setString:str];	
	levellab.visible = TRUE;	
	[game_sound play_levelup];	
	[zast runAction:iz];
	[zast1 runAction:iz1];
	//[game_sound bug_step_stop];
	[game_sound bugS_attack_stop];
	[game_sound bug_attack_stop];
}

- (void) zastMiddleCallback1 {
	
	levellab.visible = FALSE;	

}

- (void) beginLevel {
	
	level++;
	gameov = NO;
	endlevel = NO;
	
	[electro stopAllActions];
	electro.visible = NO;
	[zast stopAllActions];
	[zast1 stopAllActions];
	
	[zast runAction:zz];
	[zast1 runAction:zz1];
	
	bg.opacity = 255;
	ll.opacity = 255;
	sc.opacity = 255;
	gosprite.visible = NO;
	
	if(level > 0)
		[self save];
	else {
		metbuttonsprite.textureRect = emptyButton;
		frebuttonsprite.textureRect = emptyButton;
		roabuttonsprite.textureRect = emptyButton;
		boobuttonsprite.textureRect = emptyButton;
		medbuttonsprite.textureRect = emptyButton;
		elebuttonsprite.textureRect = emptyButton;
	}		
	
	[self unschedule: @selector(tick:)];
	
	for(int i = 0; i < BEETLE_NUM_MAX; i++)
		if(btl[i]){
			[btl[i] final];
			[btl[i] release];
			btl[i] = 0;
		}
	
	levelmaxbugs = [[Common instance]getParams:@"Bugs at the first level"] + level * [[Common instance]getParams:@"Bugs delta at the next level"];
	int bugsbegin = [[Common instance]getParams:@"Bugs at the beginning"] + level * [[Common instance]getParams:@"Bugs delta at the beginning"];
	for(int i = 0; i < bugsbegin; i++) {
		int r = CCRANDOM_0_1() * BEETLE_TYPES;
		btl[i] = [[Beetle alloc] initWithType:r anm:anm[r] anm1:anm1[r] mgr:mgr delay:0+3];
	}
	for(int i = bugsbegin; i < levelmaxbugs; i++){
		int r = CCRANDOM_0_1() * BEETLE_TYPES;
		int min = [[Common instance]getParams:@"Minimum delay before go"];
		int max = [[Common instance]getParams:@"Maximum delay before go"];
		int d = CCRANDOM_0_1() * (max-min) + min;
		btl[i] = [[Beetle alloc] initWithType:r anm:anm[r] anm1:anm1[r] mgr:mgr delay:d+3];
	}
	
	
	maxonscreen = [[Common instance]getParams:@"Maximum bugs on the screen at the first level"] + level * [[Common instance]getParams:@"Maximum bugs delta at the next level"];
	[Common instance].bugsonscreen = 0;
	
	selected = -1;
	smashcnt = 0;
	
	[Common instance].metal = NO;
	
	[self schedule: @selector(tick:) interval:0.2f];

	meddone = NO;
	metdone = NO;
	roadone = NO;
	fredone = NO;
	eledone = NO;
	boodone = NO;
	
	[self startSpecs];
}

- (void) stopSpecs {
	medallowed = NO;
	metallowed = NO;
	freallowed = NO;
	booallowed = NO;
	eleallowed = NO;
	roaallowed = NO;

	medpressed = NO;
	metpressed = NO;
	frepressed = NO;
	boopressed = NO;
	elepressed = NO;
	roapressed = NO;

	[medbuttonsprite stopAllActions];
	[metbuttonsprite stopAllActions];
	[frebuttonsprite stopAllActions];
	[boobuttonsprite stopAllActions];
	[elebuttonsprite stopAllActions];
	[roabuttonsprite stopAllActions];
	
	if(doctorlevel <= (level + 1) )
		medbuttonsprite.textureRect = medrect;
	if(metlevel <= (level + 1) )
		metbuttonsprite.textureRect = metrect;
	if(frelevel <= (level + 1) )
		frebuttonsprite.textureRect = frerect;
	if(boolevel <= (level + 1) )
		boobuttonsprite.textureRect = boorect;
	if(elelevel <= (level + 1) )
		elebuttonsprite.textureRect = elerect;
	if(roalevel <= (level + 1) )
		roabuttonsprite.textureRect = roarect;
}

- (void) startSpecs {
	medallowed = NO;
	[medbuttonsprite stopAllActions];
	if(!meddone && (doctorlevel <= (level + 1)) )
		[medbuttonsprite runAction:medbuttonanim];
	
	metallowed = NO;
	[metbuttonsprite stopAllActions];
	if(!metdone && (metlevel <= (level + 1)) )
		[metbuttonsprite runAction:metbuttonanim];
	
	freallowed = NO;
	[frebuttonsprite stopAllActions];
	if(!fredone && (frelevel <= (level + 1)) )
		[frebuttonsprite runAction:frebuttonanim];
	
	booallowed = NO;
	[boobuttonsprite stopAllActions];
	if(!boodone && (boolevel <= (level + 1)) )
		[boobuttonsprite runAction:boobuttonanim];
	
	eleallowed = NO;
	[elebuttonsprite stopAllActions];
	if(!eledone && (elelevel <= (level + 1)) )
		[elebuttonsprite runAction:elebuttonanim];
	
	roaallowed = NO;
	[roabuttonsprite stopAllActions];
	if(!roadone && (roalevel <= (level + 1)) )
		[roabuttonsprite runAction:roabuttonanim];
}

//- (void) runTimer {
//	[self schedule: @selector(tick:) interval:0.2f];
//}

- (void) dealloc {
	
	for(int i = 0; i < BEETLE_NUM_MAX; i++)
		if(btl[i]){
			[btl[i] stop];
			[btl[i] release];
		}
	
	for(int i = 0; i < BEETLE_TYPES_WITH_SPECIALS; i++) {		
		[anm[i] release];
		[anm1[i] release];
	}
	
	for(int i = 0; i < DIRKA_CNT; i++)
		[dirka[i] release];
	
	[zast release];
	[zast1 release];
	[electro release];
	[ranksprite release];
	[zz release];
	[iz release];
	[zz1 release];
	[iz1 release];	
	[gover release];
	[mgr release];
//	[mgr1 release];
	[mgr3 release];
	[levellab release];
	[scorelab release];
	[sprite release];
	[gosprite release];
	[swsprite release];
	[swanimsprite release];
	[swanimsprite1 release];
	[swanimsprite2 release];
	[swanimsprite3 release];

	[medbuttonsprite release];
	[medbuttonanim release];
	[medbuttonanim1 release];

	[metbuttonsprite release];
	[metbuttonanim release];
	[metbuttonanim1 release];
	
	[frebuttonsprite release];
	[frebuttonanim release];
	[frebuttonanim1 release];
	
	[roabuttonsprite release];
	[roabuttonanim release];
	[roabuttonanim1 release];
	
	[elebuttonsprite release];
	[elebuttonanim release];
	[elebuttonanim1 release];
	
	[boobuttonsprite release];
	[boobuttonanim release];
	[boobuttonanim1 release];
	
	
	[fork_anim release];
	[fork_anim2 release];
	[fork_anim2_1 release];
	[spoon_anim release];
	[spoon_anim2 release];
	[spoon_anim2_1 release];
	[swat_anim release];
	[swat_anim4 release];
	[swat_anim4_1 release];
	[swat_anim4_2 release];
	[swat_anim2 release];
	[swat_anim2_1 release];
		
	[electro_anim release];
	[rank_anim release];
	[sline release];
	[gline release];
	
	[super dealloc];
}

-(void) tick:(ccTime) dt {
	
	if(level < 0) {
		level = (lev >= 0)?(lev - 1):-1;
		[self beginLevel];
	}
	
	if(endlevel) {
		BOOL b = YES;
		for(int i = 0; i < (levelmaxbugs /*+ SPECIALS_NUM*/)/*BEETLE_NUM_MAX*/; i++)
			if(btl[i])
				if ([btl[i] actionsnumber])	{
					//NSLog(@"i = %d, anumber = %d", i , [btl[i] actionsnumber]);
					b = NO;
					break;
				}
		if(b)
			[self beginLevel];
	}
	
	if([Common instance].boom) {
		for(int i = 0; i < levelmaxbugs ; i++) {
			if(!btl[i])
				continue;
			if(!btl[i].waitstart)
				[btl[i] start_no_delay:ccp(-500,-500)];
		}
			
		[Common instance].boom = NO;
	}

	if([Common instance].freez) {
		for(int i = 0; i < levelmaxbugs ; i++) {
			if(!btl[i])
				continue;
			if(!btl[i].waitstart)
				[btl[i] freez];
		}
		
	}
	
	if(selected >= 0) {
		cnt++;
		if(cnt >= smashfactor)
			[self doSmash:selected swatter:NO spec:[btl[selected] isSpec]];
	}
	
	//NSLog(@"electro = %d", [Common instance].electro);
	
	BOOL metal = [Common instance].metal;
	
	if([Common instance].life < 90) {
		if([Common instance].life < 80) {
			if([Common instance].life < 70) {
				if([Common instance].life < 60) {
					if([Common instance].life < 50) {
						if([Common instance].life < 40) {
							if([Common instance].life < 30) {
								if([Common instance].life < 20) {
									if([Common instance].life < 10) {
										sprite.textureRect = metal?mettarget10:target10; 
									}else
										sprite.textureRect = metal?mettarget9:target9; 
								}else
									sprite.textureRect = metal?mettarget8:target8; 
							}else
								sprite.textureRect = metal?mettarget7:target7; 
						}else
							sprite.textureRect = metal?mettarget6:target6; 
					}else
						sprite.textureRect = metal?mettarget5:target5; 
				}else
					sprite.textureRect = metal?mettarget4:target4;
			}else
				sprite.textureRect = metal?mettarget3:target3;
		}else
			sprite.textureRect = metal?mettarget2:target2; 
	}else
		sprite.textureRect = metal?mettarget1:target1; 
	
	[Common instance].isEat = NO;
	[Common instance].numEat = 0;
	[Common instance].allSmashed = YES;
	
	for(int i = 0; i < levelmaxbugs; i++) {
		if(btl[i].already_eat) {[Common instance].isEat = YES; [Common instance].numEat++;}
		if(![btl[i] isSmashed]) [Common instance].allSmashed = NO;
	}
	
	if([Common instance].electro) {
		if(![electro numberOfRunningActions]) {
			[electro runAction:electro_anim];
			electro.visible = YES;
		}
	}
	else if(electro.visible) {
		if(![btl[levelmaxbugs + 5] isSmashed] && [btl[levelmaxbugs + 5] isDoctorOff])
		for(int i = 0; i < levelmaxbugs; i++)
			if(![btl[i] isSmashed] && [btl[i] onScreen] && btl[i].already_eat)
					[self doSmash:i swatter:YES spec:NO];
		[electro stopAllActions];
		electro.visible = NO;
		
	}
	
	for(int i = 0; i < (levelmaxbugs + SPECIALS_NUM); i++) {
		if(!btl[i])
			continue;
		//NSLog(@"bug %d frozen %d", i, btl[i].frozen);
		int x2 = APPLE_X;
		int y2 = APPLE_Y;
		int x1 = btl[i].positionX;
		int y1 = btl[i].positionY;
		double d = sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
		if(d < 50)		
			[btl[i] startEat];
		
		if(btl[i].waitstart) {
			if(([Common instance].bugsonscreen < maxonscreen) || (i >= levelmaxbugs)) {
				//NSLog(@"start %d",i);
				[btl[i] start];
			}
		}
		if([btl[i] isDiedOutScreen])
			[self doSmash:i swatter:NO spec:[btl[i] isSpec]];

		if([btl[i] isDoctorOff]){
			//NSLog(@"i = %d, doctoroff = %d", i, [btl[i] isDoctorOff]);
			[self doSmash:i swatter:YES spec:YES];
		}

		if(!btl[i].waitstart && (i < levelmaxbugs)) {
			if(![Common instance].freez && btl[i].frozen)
				[btl[i] unfreez];

		if(!btl[i].waitstart && (i < levelmaxbugs) && ([Common instance].roar != btl[i].roared))
			[btl[i] start];
		}
	}
	
	if([Common instance].isEat && !game_sound.isPlayEat && !gameov) 
	{[game_sound bug_attack_start];
	}
	if ([Common instance].isEat && ([Common instance].numEat > 1) && !game_sound.isPlayEatS && !gameov)
	{[game_sound bugS_attack_start]; //[game_sound bug_attack_stop];
	}
	if(![Common instance].allSmashed && !game_sound.isPlayStep && ([Common instance].life > 0)){
		[game_sound bug_step_start];
	}
	if([Common instance].allSmashed)
		if(game_sound.isPlayStep) [game_sound bug_step_stop];
	
	if(![Common instance].isEat){
		if(game_sound.isPlayEat) [game_sound bug_attack_stop];
		if(game_sound.isPlayEatS) [game_sound bugS_attack_stop];
	}	
	//else [game_sound bug_step_stop];
	
	[sline refresh:[Common instance].life];
	[gline refresh:[Common instance].supergun];
	
	if(!gameov && ([Common instance].life <= 0)){
		gameov  = YES;
		gosprite.visible = YES;
		gosprite.scale = 0.1;
		[gosprite runAction:gover];
		[self delet];
		
		[game_sound bug_step_stop];
		[game_sound bug_attack_stop];
		[game_sound bugS_attack_stop];
	}
	
}

-(void)ccTouchesBegan:(NSSet* )touches withEvent:(UIEvent* )event {
	
	//	NSLog(@"ccTouchesBegan");
	if(selected > -1)
		return;// kEventHandled;
	
	UITouch *touch = [touches anyObject];	
	CGPoint location = [touch locationInView: [touch view]];
//	CGPoint convertedLocation = [[CCDirector sharedDirector] convertCoordinate:location];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

	int tx = convertedLocation.x;
	int ty = convertedLocation.y;
	
	if (medallowed) {
	double d = sqrt((MEDBUTTON_X-tx)*(MEDBUTTON_X-tx)+(MEDBUTTON_Y-ty)*(MEDBUTTON_Y-ty));
		if(d < 20)
			medpressed = YES;
	}	

	if (metallowed) {
		double d = sqrt((METBUTTON_X-tx)*(METBUTTON_X-tx)+(METBUTTON_Y-ty)*(METBUTTON_Y-ty));
		if(d < 20)
			metpressed = YES;
	}	
	
	if (booallowed) {
		double d = sqrt((BOOBUTTON_X-tx)*(BOOBUTTON_X-tx)+(BOOBUTTON_Y-ty)*(BOOBUTTON_Y-ty));
		if(d < 20)
			boopressed = YES;
	}	

	if (freallowed) {
		double d = sqrt((FREBUTTON_X-tx)*(FREBUTTON_X-tx)+(FREBUTTON_Y-ty)*(FREBUTTON_Y-ty));
		if(d < 20)
			frepressed = YES;
	}	

	if (roaallowed) {
		double d = sqrt((ROABUTTON_X-tx)*(ROABUTTON_X-tx)+(ROABUTTON_Y-ty)*(ROABUTTON_Y-ty));
		if(d < 20)
			roapressed = YES;
	}	

	if (eleallowed) {
		double d = sqrt((ELEBUTTON_X-tx)*(ELEBUTTON_X-tx)+(ELEBUTTON_Y-ty)*(ELEBUTTON_Y-ty));
		if(d < 20)
			elepressed = YES;
	}	
	
	if((tx > 410) && (tx < 440)  && (ty < 30)) {
		psprite.textureRect = pause2;
		pause = YES;
	}
	
	if(!swatter && (tx < 95) && (tx > 30)  && (ty < 40)) 
		if([Common instance].supergun > 15)
			swatter = YES;
	
	
	CGPoint sPoint = CGPointMake(tx, ty);
	
	for(int i = 0; i < (levelmaxbugs + SPECIALS_NUM); i++) {
		if(!btl[i])
			continue;
		CGRect sRect = [btl[i] getRect]; 
		if(![btl[i] isSmashed] && CGRectContainsPoint( sRect, sPoint ) ) {
			selected = i;
			//[btl[i] stop];
			cnt = 0;
			//NSLog(@"select! %d", i);
			break;
		}
	}
	oldx = tx;
	oldy = ty;
	ooldx = ooldy = 0;
	
	//	[self goverCallback1];
	
	return;// kEventHandled;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	//	NSLog(@"ccTouchesEnded");
	UITouch *touch = [touches anyObject];	
	CGPoint location = [touch locationInView: [touch view]];
//	CGPoint convertedLocation = [[CCDirector sharedDirector] convertCoordinate:location];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

	int tx = convertedLocation.x;
	int ty = convertedLocation.y;
	
	if (medpressed && medallowed) {
		medpressed = NO;
		medallowed = NO;
		double d = sqrt((MEDBUTTON_X-tx)*(MEDBUTTON_X-tx)+(MEDBUTTON_Y-ty)*(MEDBUTTON_Y-ty));		
		if(d < 20) {
			[medbuttonsprite stopAllActions];
			[medbuttonsprite runAction:medbuttonanim1];
			btl[levelmaxbugs] = [[Beetle alloc] initWithType:DOCTOR_TYPE anm:anm[DOCTOR_TYPE] anm1:anm1[DOCTOR_TYPE] mgr:mgr delay:0];
			meddone = YES;
			//[game_sound play_medic];
		}
	}	

	if (metpressed && metallowed) {
		metpressed = NO;
		metallowed = NO;
		double d = sqrt((METBUTTON_X-tx)*(METBUTTON_X-tx)+(METBUTTON_Y-ty)*(METBUTTON_Y-ty));		
		if(d < 20) {
			[metbuttonsprite stopAllActions];
			[metbuttonsprite runAction:metbuttonanim1];
			btl[levelmaxbugs + 1] = [[Beetle alloc] initWithType:METAL_TYPE anm:anm[METAL_TYPE] anm1:anm1[METAL_TYPE] mgr:mgr delay:0];
			metdone = YES;
			//[game_sound play_metal];
		}
	}	

	if (boopressed && booallowed) {
		boopressed = NO;
		booallowed = NO;
		double d = sqrt((BOOBUTTON_X-tx)*(BOOBUTTON_X-tx)+(BOOBUTTON_Y-ty)*(BOOBUTTON_Y-ty));		
		if(d < 20) {
			[boobuttonsprite stopAllActions];
			[boobuttonsprite runAction:boobuttonanim1];
			btl[levelmaxbugs + 2] = [[Beetle alloc] initWithType:BOOMER_TYPE anm:anm[BOOMER_TYPE] anm1:anm1[BOOMER_TYPE] mgr:mgr delay:0];
			boodone = YES;
			//[game_sound play_bomb];
		}
	}	

	if (frepressed && freallowed) {
		frepressed = NO;
		freallowed = NO;
		double d = sqrt((FREBUTTON_X-tx)*(FREBUTTON_X-tx)+(FREBUTTON_Y-ty)*(FREBUTTON_Y-ty));		
		if(d < 20) {
			[frebuttonsprite stopAllActions];
			[frebuttonsprite runAction:frebuttonanim1];
			btl[levelmaxbugs + 3] = [[Beetle alloc] initWithType:FREEZ_TYPE anm:anm[FREEZ_TYPE] anm1:anm1[FREEZ_TYPE] mgr:mgr delay:0];
			fredone = YES;
			//[game_sound play_frize];
		}
	}	

	if (roapressed && roaallowed) {
		roapressed = NO;
		roaallowed = NO;
		double d = sqrt((ROABUTTON_X-tx)*(ROABUTTON_X-tx)+(ROABUTTON_Y-ty)*(ROABUTTON_Y-ty));		
		if(d < 20) {
			[roabuttonsprite stopAllActions];
			[roabuttonsprite runAction:roabuttonanim1];
			btl[levelmaxbugs + 4] = [[Beetle alloc] initWithType:ROAR_TYPE anm:anm[ROAR_TYPE] anm1:anm1[ROAR_TYPE] mgr:mgr delay:0];
			roadone = YES;
			//[game_sound play_roar];
		}
	}	

	if (elepressed && eleallowed) {
		elepressed = NO;
		eleallowed = NO;
		double d = sqrt((ELEBUTTON_X-tx)*(ELEBUTTON_X-tx)+(ELEBUTTON_Y-ty)*(ELEBUTTON_Y-ty));		
		if(d < 20) {
			[elebuttonsprite stopAllActions];
			[elebuttonsprite runAction:elebuttonanim1];
			btl[levelmaxbugs + 5] = [[Beetle alloc] initWithType:ELECTRO_TYPE anm:anm[ELECTRO_TYPE] anm1:anm1[ELECTRO_TYPE] mgr:mgr delay:0];
			eledone = YES;
		}
	}	
	
	if(pause) {
		pause = NO;
		psprite.textureRect = pause1;
		if((tx > 410) && (tx < 440)  && (ty < 30)) {
			//psprite.textureRect = pause1;
			[self pauseCallback:self];
		}
	}
	
	if(swatter && ![swanimsprite numberOfRunningActions] && ![swanimsprite1 numberOfRunningActions]&& ![swanimsprite2 numberOfRunningActions]&& ![swanimsprite3 numberOfRunningActions]) {
		if((tx < 95) && (tx > 30)  && (ty < 40)) { 
		
		//		NSLog(@"swatter2 = %d", swatter);
		//swatter = NO;
		swsprite.textureRect = swatter1;
		swanimsprite.visible = YES;
		
		//[swanimsprite runAction:spoon_anim];
		if([Common instance].supergun < 88) {
			if([Common instance].supergun < 76) {
				if([Common instance].supergun < 64) {
					if([Common instance].supergun < 52) {
						if([Common instance].supergun < 40) {
							if([Common instance].supergun < 28){
										[swanimsprite runAction: fork_anim];
										[game_sound bug_killer2];
							}
							else{
								[swanimsprite runAction: spoon_anim];
								[game_sound bug_killer2];
							}
						}else{ 
							[swanimsprite runAction: swat_anim];
							[game_sound bug_killer];
						}
					}else {
						[swanimsprite runAction: fork_anim2];
						[swanimsprite1 runAction: fork_anim2_1];
						[game_sound bug_killer2];
					}
				}else {
					[swanimsprite runAction: spoon_anim2];
					[swanimsprite1 runAction: spoon_anim2_1];
					[game_sound bug_killer2];
				}
			}else {
				[swanimsprite runAction: swat_anim2];
				[swanimsprite1 runAction: swat_anim2_1];
				[game_sound bug_killer];
			}
		}else {
			[swanimsprite runAction: swat_anim4];
			[swanimsprite1 runAction: swat_anim2_1];
			[swanimsprite2 runAction: swat_anim4_1];
			[swanimsprite3 runAction: swat_anim4_2];
			[game_sound bug_killer];
		}
		
		[Common instance].supergun = 0;
		} else
			swatter = NO;
	}
	if(selected < 0)
		return;// kEventHandled;
	
	int x = tx + ((ooldx > 0)?((tx - ooldx) * 2) : 0);
	int y = ty + ((ooldy > 0)?((ty - ooldy) * 2) : 0);
	[btl[selected] start_no_delay: ccp(x,y)];
	
	selected = -1;
	
	return;// kEventHandled;
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	
	//	NSLog(@"ccTouchesMoved");
	
	if(selected < 0)
		return;// kEventHandled;
	
	UITouch *touch = [touches anyObject];	
	CGPoint location = [touch locationInView: [touch view]];
//	CGPoint convertedLocation = [[CCDirector sharedDirector] convertCoordinate:location];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

	int tx = convertedLocation.x;
	int ty = convertedLocation.y;
	
	//	NSLog(@"moved convertedLocation.x=%d, convertedLocation.y=%d",tx,ty);
	
	[btl[selected] stop];
	//[btl[selected] setPosition:ccp(oldx, oldy)];
	[btl[selected] moveto:0.02f position:ccp(tx, ty)];
	[btl[selected] rotate:ccp(tx, ty)];
	
	if((abs(oldx - tx) < smashfactor) && (abs(oldy - ty) < smashfactor)){
		[self doSmash:selected swatter:NO spec:[btl[selected] isSpec]];
	}
	else 	[game_sound bug_move]; //drm
	
	ooldx = oldx;
	ooldy = oldy;
	
	oldx = tx;
	oldy = ty;
	
	return;// kEventHandled;
}

- (void) doSmash:(int)i swatter:(BOOL)isswatter spec:(BOOL)isspec {
	//NSLog(@"smashed = %d", i);
	[btl[/*selected*/i] smash];
//	selected = -1;
	
	if (!isspec) {
		smashcnt++;
		[Common instance].score += 100;	
		
		BOOL b = YES;
		switch ([Common instance].score) {
			case 10000: ranksprite.textureRect = rank1;[game_sound bonus_play:1];break; 
			case 20000: ranksprite.textureRect = rank2;[game_sound bonus_play:2];break; 
			case 30000: ranksprite.textureRect = rank3;[game_sound bonus_play:3];break; 
			case 40000: ranksprite.textureRect = rank4;[game_sound bonus_play:4];break; 
			case 50000: ranksprite.textureRect = rank5;[game_sound bonus_play:5];break; 
			case 60000: ranksprite.textureRect = rank6;[game_sound bonus_play:6];break; 
			case 70000: ranksprite.textureRect = rank7;[game_sound bonus_play:7];break; 
			case 80000: ranksprite.textureRect = rank8;[game_sound bonus_play:8];break; 
			case 90000: ranksprite.textureRect = rank9;[game_sound bonus_play:9];break; 
			case 100000: ranksprite.textureRect = rank10;[game_sound bonus_play:10];break; 
			case 110000: ranksprite.textureRect = rank11;[game_sound bonus_play:11];break; 
			case 120000: ranksprite.textureRect = rank12;[game_sound bonus_play:12];break; 
			case 130000: ranksprite.textureRect = rank13;[game_sound bonus_play:13];break; 
			case 140000: ranksprite.textureRect = rank14;[game_sound bonus_play:14];break; 
			case 150000: ranksprite.textureRect = rank15;[game_sound bonus_play:15];break; 
			default: b = NO;
		}
		
		if(b) {
			ranksprite.visible = YES;
			[ranksprite runAction:rank_anim];
		}
		
		//[game_sound bonus_play:[Common instance].score];
		NSString* str1 = [NSString stringWithFormat:@"%07d",[Common instance].score];
		[scorelab setString:str1];
	}
	
	if(!isswatter){
		[Common instance].supergun += 2;
		if([Common instance].supergun > 100)
			[Common instance].supergun = 100;
		
//		if([Common instance].supergun >= 100)
//			swsprite.textureRect = swatter2;
		
				if([Common instance].supergun < 88) {
					if([Common instance].supergun < 76) {
						if([Common instance].supergun < 64) {
							if([Common instance].supergun < 52) {
								if([Common instance].supergun < 40) {
									if([Common instance].supergun < 28) {
										if([Common instance].supergun < 16) {
											swsprite.textureRect = swatter1;
										}else
											swsprite.textureRect = swatter2;
									}else
										swsprite.textureRect = swatter3;
								}else
									swsprite.textureRect = swatter4;
							}else
								swsprite.textureRect = swatter5;
						}else
							swsprite.textureRect = swatter6;
					}else
						swsprite.textureRect = swatter7;
				}else
					swsprite.textureRect = swatter8;
		
	}
//	NSLog(@"smashcnt = %d,levelmaxbugs = %d", smashcnt, levelmaxbugs);
	if(smashcnt >= levelmaxbugs)
		endlevel = YES;
	if(isspec)
		[self startSpecs];

	selected = -1;

}

/*- (BOOL)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
 
 if(selected < 0)
 return kEventHandled;
 
 [btl[selected] stopAllActions];
 //	btl[selected].visible = NO;
 
 return kEventHandled;
 }*/

- (void) delet {

	NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* docpath = [sp objectAtIndex: 0];
	NSString* fname = [docpath stringByAppendingPathComponent:@"level"];
	NSError* err = nil;
	[[NSFileManager defaultManager] removeItemAtPath:fname error:&err];
		
}

- (void) save {
	
	NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* docpath = [sp objectAtIndex: 0];
	NSString* fname = [docpath stringByAppendingPathComponent:@"level"];
	//	NSLog(@"fname write = %@", fname);
	BOOL fe = [[NSFileManager defaultManager] fileExistsAtPath:fname];
	//	NSError* err = nil;
	if(!fe) {
		//		[[NSFileManager defaultManager] removeItemAtPath:fname error:&err];
		//		if(err != noErr)
		//			return;
		[[NSFileManager defaultManager] createFileAtPath:fname contents:nil attributes:nil];
	}
	NSOutputStream* ostream = [NSOutputStream outputStreamToFileAtPath:fname append:NO];
	[ostream open];
	//level = 5;
	/*NSInteger t = */[ostream write:(const uint8_t*)&level maxLength:sizeof(level)];
	double lif = [Common instance].life;
	int scr = [Common instance].score;
	int spg = [Common instance].supergun;
	[ostream write:(const uint8_t*)&lif maxLength:sizeof(lif)];
	[ostream write:(const uint8_t*)&scr maxLength:sizeof(scr)];
	[ostream write:(const uint8_t*)&spg maxLength:sizeof(spg)];
	//	NSLog(@"write life = %f, score = %d, sgun = %d", lif, scr, spg);
	//	NSLog(@"level write = %d", level);
	//	NSLog(@"bytes write = %d", t);
	[ostream close];	
	
	//	[self load];
}

- (void) load {
	
	[[Common instance] resetGame];
	
	NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* docpath = [sp objectAtIndex: 0];
	NSString* fname = [docpath stringByAppendingPathComponent:@"level"];
	//	NSLog(@"fname read = %@", fname);
	NSInputStream* istream = [[NSInputStream alloc] initWithFileAtPath:fname];
	[istream open];
	double lif = 0;
	int scr = 0;
	int spg = 0;
	NSInteger t = [istream read:(uint8_t*)&lev maxLength:sizeof(lev)];
	if(t < 0)
		lev = 0;
	else {
	[istream read:(uint8_t*)&lif maxLength:sizeof(lif)];
	[istream read:(uint8_t*)&scr maxLength:sizeof(scr)];
	[istream read:(uint8_t*)&spg maxLength:sizeof(spg)];
	[Common instance].life = lif;
	[Common instance].score = scr;
	[Common instance].supergun = spg;
	
	NSString* str1 = [NSString stringWithFormat:@"%07d",[Common instance].score];
	[scorelab setString:str1];	
	}
	//	NSLog(@"read life = %f, score = %d, sgun = %d", lif, scr, spg);
	//	NSLog(@"bytes read = %d", t);
	//	NSLog(@"level readed = %d", lev);
	[istream close];
	[istream release];
	level = -1;
}

@end