//
//  MenuScene.m
//  Beetles
//
//  Created by вввв ввв on 6/17/09.
//  Copyright 2009 ввв. All rights reserved.
//
#import "GameScene1.h"
#import "MenuScene.h"
#import "Common.h"
#import "AngryBugsOFDelegate.h"
#import "OpenFeint.h"

//#import <mach/mach.h>
//#import <mach/mach_host.h>

@implementation MenuScene

- (id) init {
	self = [super init];
	if(self !=nil) {
		[self addChild:[MenuLayer node] z:0];
	}
	return self;
}

@end

@implementation MenuLayer
- (id) init {
	self = [super init];
	if(self != nil) {
		
		isTouchEnabled = YES;
		
		htp = [CCSprite spriteWithFile:@"howtoplay.png"];
		//htp.autoCenterFrames = YES;
		htp.position = ccp(240, 160);
		htp.visible = NO;
		[self addChild:htp z:10];
		
		CCSprite* bg = [CCSprite spriteWithFile:@"Fon_menu2.png"];
		bg.position = ccp(240, 160);
		//bg.autoCenterFrames = YES;
		[self addChild:bg z:0];	
		
		CCMenuItemImage *item1 = [CCMenuItemImage itemFromNormalImage:@"game3.png" selectedImage:@"game3 pressed.png" target:self selector:@selector(gameCallback:)];
		CCMenuItemImage *item2 = [CCMenuItemImage itemFromNormalImage:@"continue3.png" selectedImage:@"continue3 pressed.png" target:self selector:@selector(optionsCallback:)];
		CCMenuItemImage *item3 = [CCMenuItemImage itemFromNormalImage:@"how_to_pl.png" selectedImage:@"how_to_pl_pres.png" target:self selector:@selector(howCallback:)];
		CCMenuItemImage *item4 = [CCMenuItemImage itemFromNormalImage:@"music3.png" selectedImage:@"music3 pressed.png" target:self selector:@selector(musikCallback:)];
		CCMenuItemImage *item5 = [CCMenuItemImage itemFromNormalImage:@"sfx3.png" selectedImage:@"sfx3 pressed.png" target:self selector:@selector(sfxCallback:)];
		CCMenuItemImage *item6 = [CCMenuItemImage itemFromNormalImage:@"high_scor.png" selectedImage:@"high_scor_pres.png" target:self selector:@selector(highCallback:)];
		menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5, item6, nil];
/*		menu.position = ccp(0,0);
		item1.position = ccp(74, 110);	
		item2.position = ccp(74, 70);	
		item3.position = ccp(400, 110);	
		item4.position = ccp(75, 30);	
		item5.position = ccp(400, 70);	
		item6.position = ccp(400, 30);	
*/		menu.position = ccp(0,0);
		item1.position = ccp(375, 290);	
		item2.position = ccp(325, 240);	
		item3.position = ccp(310, 190);	
		item4.position = ccp(290, 140);	
		item5.position = ccp(270, 90);	
		item6.position = ccp(260, 40);	
		
		[self addChild: menu z:5];
		/*if([Common instance].showScore){
		[[Director sharedDirector] replaceScene:[Common instance].scorescene];
		[Common instance].showScore = NO;
		}*/
		
		NSDictionary* settings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight], OpenFeintSettingDashboardOrientation, [NSNumber numberWithBool:YES],								  
								  OpenFeintSettingDisableUserGeneratedContent, nil];

		ofDelegate = [AngryBugsOFDelegate new];
		
		OFDelegatesContainer* delegates = [OFDelegatesContainer containerWithOpenFeintDelegate:ofDelegate];
		
		[OpenFeint initializeWithProductKey:@"OcXzOKwbZWEo6VkEnWhA"
		 
								  andSecret:@"4lDr9D22PKZz43llkIG43GQSSFExOHQUKyV77dBTUc"
		 
							 andDisplayName:@"Angry Bugs"
		 
								andSettings:settings    // see OpenFeintSettings.h
		 
							   andDelegates:delegates]; // see OFDelegatesContainer.h
		
	
	}
	return self;
}

- (void) gameCallback:(id) sender {
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	//	[[Common instance].gamescene runTimer];
	
	[[CCDirector sharedDirector] replaceScene:[Common instance].gamescene];
	//[game_sound bug_attack_init];	
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	{
		[game_sound bug_muteOFF];
		[game_sound click_01];
	}	
	else {
		[game_sound bug_muteON];
	}

	//[game_sound startBGmusic];
	if([Common instance].MusicONOFF && [Common instance].VolumeONOFF){
	[game_sound musicON]; [game_sound startBGmusic];
	}
	else [game_sound musicOFF];
}

- (void) optionsCallback:(id) sender {
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	[[Common instance].gamescene load];
//	[[Common instance].gamescene runTimer];
	[[CCDirector sharedDirector] replaceScene:[Common instance].gamescene];
	
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	{
		[game_sound bug_muteOFF];
		[game_sound click_01];
	}	
	else {
		[game_sound bug_muteON];
	}
	
	//[game_sound startBGmusic];
	if([Common instance].MusicONOFF && [Common instance].VolumeONOFF){
		[game_sound musicON]; [game_sound startBGmusic];
	}
	else [game_sound musicOFF];
}

- (void) howCallback:(id) sender {	
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	
	htp.visible = YES;
	//menu.visible = NO;
	
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	{
		//[game_sound bug_muteOFF];
		[game_sound click_01];
	}
}

- (void) musikCallback:(id) sender {
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	
	if([Common instance].MusicONOFF){
		[Common instance].MusicONOFF = NO;
	}
	else {
		[Common instance].MusicONOFF = YES;	
		[game_sound click_01];
	}
}

- (void) sfxCallback:(id) sender {
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	
	if([Common instance].SfxONOFF)
		[Common instance].SfxONOFF = NO;
	else {
		[Common instance].SfxONOFF = YES;
		[game_sound click_01];
	}
}

- (void) highCallback:(id) sender {
	if(htp.visible) {
		htp.visible = NO;
		return;
	}
	
	[Common instance].scorescene = [ScoreScene node];
	[[CCDirector sharedDirector] replaceScene:[Common instance].scorescene]; //drm	
	if([Common instance].SfxONOFF && [Common instance].VolumeONOFF) 
	{
		[game_sound bug_muteOFF];
		[game_sound click_01];
	}
}

-(void)ccTouchesBegan:(NSSet* )touches withEvent:(UIEvent* )event{
	if(htp.visible) {
		htp.visible = NO;
	//	menu.visible = YES;
	}
	return;// kEventHandled;
}

- (void) dealloc{
	
	[htp release];
	[super dealloc];
}
 

@end
