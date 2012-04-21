/*
 *  Common.h
 *  Beetles
 *
 *  Created by вадим on 5/9/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#pragma once

#import "GameScene1.h"
//#import "MenuScene.h"
#import "AnimScene.h"
//#import "ScoreScene.h"

#import "SoundSupport.h" //drm
extern SoundSupport* game_sound; //drm

@class ScoreScene;
@class MenuScene;

#define APPLE_X 250//240//250
#define APPLE_Y 170//160//170
#define BUGS_DURATION 15

@interface Common : NSObject  {
	NSMutableDictionary* plistDict;
	NSMutableDictionary* plistDict1;
	NSMutableDictionary* plistDict2;
	NSMutableDictionary* plistDict3;
	NSMutableDictionary* params;
	int score;
	double life;
	int supergun;
	BOOL VolumeONOFF;
	BOOL SfxONOFF;
	BOOL MusicONOFF;
	BOOL isEat;
	int numEat;
	BOOL allSmashed;
	BOOL showScore;
	BOOL metal;
	BOOL boom;
	BOOL freez;
	BOOL roar;
	BOOL electro;
	GameScene1* gamescene;
	MenuScene* menuscene;	
	AnimScene* animscene;
	ScoreScene* scorescene;
	int bugsonscreen;
}

@property (readwrite) int score;
@property (readwrite) BOOL VolumeONOFF;
@property (readwrite) BOOL SfxONOFF;
@property (readwrite) BOOL MusicONOFF;
@property (readwrite) BOOL isEat;
@property (readwrite) int numEat;
@property (readwrite) BOOL allSmashed;
@property (readwrite) BOOL showScore;
@property (readwrite) BOOL metal;
@property (readwrite) BOOL boom;
@property (readwrite) BOOL freez;
@property (readwrite) BOOL electro;
@property (readwrite) BOOL roar;
@property (readwrite) double life;
@property (readwrite) int supergun;
@property (retain, readwrite) GameScene1* gamescene;
@property (retain, readwrite) MenuScene* menuscene;
@property (retain, readwrite) AnimScene* animscene;
@property (retain, readwrite) ScoreScene* scorescene;
@property (readwrite) int bugsonscreen;

+ (Common*) instance;

//- (NSMutableDictionary*) getPlistDict;
- (CGRect) readPlist: (NSString*) name;
- (CGRect) readPlist1: (NSString*) name;
- (CGRect) readPlist2: (NSString*) name;
- (CGRect) readPlist3: (NSString*) name;
- (int) getParams: (NSString*) name;
- (void) resetGame;

@end