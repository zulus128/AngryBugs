//
//  PauseScene.m
//  Beetles
//
//  Created by вввв ввв on 6/15/09.
//  Copyright 2009 ввв. All rights reserved.
//
#import "GameScene1.h"
#import "PauseScene.h"
#import "Common.h"

@implementation PauseScene

- (id) init {
	self = [super init];
	if(self !=nil) {
		[self addChild:[PauseLayer node] z:0];
	}
	return self;
}

@end

@implementation PauseLayer
- (id) init {
	self = [super init];
	if(self != nil) {
		
		isTouchEnabled = YES;
		
		CCSprite* bg = [CCSprite spriteWithFile:@"pause fon3.png"];
		bg.position = ccp(240, 160);
		//bg.autoCenterFrames = YES;
		[self addChild:bg z:0];	
		
		CCMenuItemImage *item1 = [CCMenuItemImage itemFromNormalImage:@"continue.png" selectedImage:@"continue pressed.png" target:self selector:@selector(continueCallback:)];
		CCMenuItemImage *item2 = [CCMenuItemImage itemFromNormalImage:@"musik.png" selectedImage:@"musik pressed.png" target:self selector:@selector(musikCallback:)];
		CCMenuItemImage *item3 = [CCMenuItemImage itemFromNormalImage:@"sound.png" selectedImage:@"sound pressed.png" target:self selector:@selector(soundCallback:)];
		CCMenuItemImage *item4 = [CCMenuItemImage itemFromNormalImage:@"sfx.png" selectedImage:@"sfx pressed.png" target:self selector:@selector(sfxCallback:)];
		CCMenu *menu = [CCMenu menuWithItems:item1, item2, item3, item4, nil];
/*		menu.position = ccp(0,0);
		item1.position = ccp(240, 145);	
		item2.position = ccp(240, 65);	
		item3.position = ccp(240, 105);	
		item4.position = ccp(240, 25);	
*/		menu.position = ccp(0,0);
		item1.position = ccp(340, 185);	
		item2.position = ccp(340, 95);	
		item3.position = ccp(340, 145);	
		item4.position = ccp(340, 35);	
		
		[self addChild: menu z:5];
		
	}
	return self;
}

- (void) continueCallback:(id) sender {
	[[CCDirector sharedDirector] popScene];
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	{
		[game_sound bug_muteOFF];
		[game_sound click_01];
	}
	else {
		[game_sound bug_muteON];
	}

	if([Common instance].MusicONOFF && [Common instance].VolumeONOFF) [game_sound musicON];
	//if([Common instance].VolumeONOFF)
}

- (void) musikCallback:(id) sender {
	if([Common instance].MusicONOFF){
		[Common instance].MusicONOFF = NO;
	}
	else {
		[Common instance].MusicONOFF = YES;	
		[game_sound click_01];
	}
}

- (void) soundCallback:(id) sender {
	if([Common instance].VolumeONOFF)
		[Common instance].VolumeONOFF = NO;
	else {
		[Common instance].VolumeONOFF = YES;
		[game_sound click_01];
	}
}

- (void) sfxCallback:(id) sender {
	if([Common instance].SfxONOFF)
		 [Common instance].SfxONOFF = NO;
	else {
		[Common instance].SfxONOFF = YES;
		[game_sound click_01];
	}
}

- (void) dealloc{

	[super dealloc];
}

@end
