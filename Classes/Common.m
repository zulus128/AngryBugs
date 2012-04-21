//
//  Common.m
//  Beetles
//
//  Created by вадим on 6/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Common.h"
#import "ScoreScene.h"
#import "MenuScene.h"

SoundSupport* game_sound;

@implementation Common
+ (Common*) instance  {
	static Common* instance;
	@synchronized(self) {
		if(!instance) {
			instance = [[Common alloc] init];
		}
	}
	return instance;
}

@synthesize score;
@synthesize VolumeONOFF;
@synthesize SfxONOFF;
@synthesize MusicONOFF;
@synthesize isEat;
@synthesize numEat;
@synthesize allSmashed;
@synthesize showScore;
@synthesize metal;
@synthesize boom;
@synthesize freez;
@synthesize electro;
@synthesize roar;
@synthesize life;
@synthesize supergun;
@synthesize gamescene;
@synthesize menuscene;
@synthesize animscene;
@synthesize scorescene;
@synthesize bugsonscreen;

- (id) init {
	self = [super init];
	if(self !=nil) {
		
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coordinates" ofType:@"plist"];
//		plistDict = [[[NSMutableDictionary alloc] initWithContentsOfFile:filePath]objectForKey:@"frames"];
		plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
		NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"coordinates1" ofType:@"plist"];
		plistDict1 = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath1];
		NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"coordinates2" ofType:@"plist"];
		plistDict2 = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath2];
		NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"coordinates3" ofType:@"plist"];
		plistDict3 = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath3];
		NSString *appFile = [[NSBundle mainBundle] pathForResource:@"params" ofType:@"plist"];
		params = [[NSMutableDictionary alloc] initWithContentsOfFile:appFile];
		
		[self resetGame];
		VolumeONOFF = YES; //drm
		SfxONOFF = YES;
		MusicONOFF = YES;
		isEat = NO;
		numEat = 0;
		allSmashed = YES;
	}
	return self;	
}

- (void) resetGame {
	score = 0;
	life = 100;//0.3f;
	supergun = 0;
	boom = NO;
	metal = NO;
	freez = NO;
	roar = NO;
	electro = NO;
}

- (void) dealloc{
	[params release];
	[plistDict release];
	[plistDict1 release];
	[super dealloc];
	
}

//- (NSMutableDictionary*) getPlistDict {
//	return plistDict;
//}

- (CGRect) readPlist: (NSString*) name {
	
	NSString *s = [[plistDict objectForKey:name]objectForKey:@"x"];
	int x = [s intValue];
	s = [[plistDict objectForKey:name]objectForKey:@"y"];
	int y = [s intValue];
//	s = [[plistDict objectForKey:name]objectForKey:@"width"];
	s = [[plistDict objectForKey:name]objectForKey:@"w"];
	int w = [s intValue];
//	s = [[plistDict objectForKey:name]objectForKey:@"height"];
	s = [[plistDict objectForKey:name]objectForKey:@"h"];
	int h = [s intValue];
	s = [[plistDict objectForKey:name]objectForKey:@"offsetX"];
	int offsetX = 2*[s intValue];
	s = [[plistDict objectForKey:name]objectForKey:@"offsetY"];
	int offsetY = 2*[s intValue];
	
	int xx = (offsetX < 0)?offsetX:0;
	int yy = (offsetY < 0)?offsetY:0;
	return CGRectMake(x + xx, y + yy, w + abs(offsetX), h + abs(offsetY));
	
}

- (CGRect) readPlist1: (NSString*) name {
	
	NSString *s = [[plistDict1 objectForKey:name]objectForKey:@"x"];
	int x = [s intValue];
	s = [[plistDict1 objectForKey:name]objectForKey:@"y"];
	int y = [s intValue];
	s = [[plistDict1 objectForKey:name]objectForKey:@"w"];
	int w = [s intValue];
	s = [[plistDict1 objectForKey:name]objectForKey:@"h"];
	int h = [s intValue];
	s = [[plistDict1 objectForKey:name]objectForKey:@"offsetX"];
	int offsetX = 2*[s intValue];
	s = [[plistDict1 objectForKey:name]objectForKey:@"offsetY"];
	int offsetY = 2*[s intValue];
	
	int xx = (offsetX < 0)?offsetX:0;
	int yy = (offsetY < 0)?offsetY:0;
	return CGRectMake(x + xx, y + yy, w + abs(offsetX), h + abs(offsetY));
	
}

- (CGRect) readPlist2: (NSString*) name {
	
	NSString *s = [[plistDict2 objectForKey:name]objectForKey:@"x"];
	int x = [s intValue];
	s = [[plistDict2 objectForKey:name]objectForKey:@"y"];
	int y = [s intValue];
	s = [[plistDict2 objectForKey:name]objectForKey:@"w"];
	int w = [s intValue];
	s = [[plistDict2 objectForKey:name]objectForKey:@"h"];
	int h = [s intValue];
	s = [[plistDict2 objectForKey:name]objectForKey:@"offsetX"];
	int offsetX = 2*[s intValue];
	s = [[plistDict2 objectForKey:name]objectForKey:@"offsetY"];
	int offsetY = 2*[s intValue];
	
	int xx = (offsetX < 0)?offsetX:0;
	int yy = (offsetY < 0)?offsetY:0;
	return CGRectMake(x + xx, y + yy, w + abs(offsetX), h + abs(offsetY));
	
}

- (CGRect) readPlist3: (NSString*) name {
	
	NSString *s = [[plistDict3 objectForKey:name]objectForKey:@"x"];
	int x = [s intValue];
	s = [[plistDict3 objectForKey:name]objectForKey:@"y"];
	int y = [s intValue];
	s = [[plistDict3 objectForKey:name]objectForKey:@"w"];
	int w = [s intValue];
	s = [[plistDict3 objectForKey:name]objectForKey:@"h"];
	int h = [s intValue];
	s = [[plistDict3 objectForKey:name]objectForKey:@"offsetX"];
	int offsetX = 2*[s intValue];
	s = [[plistDict3 objectForKey:name]objectForKey:@"offsetY"];
	int offsetY = 2*[s intValue];
	
	int xx = (offsetX < 0)?offsetX:0;
	int yy = (offsetY < 0)?offsetY:0;
	return CGRectMake(x + xx, y + yy, w + abs(offsetX), h + abs(offsetY));
	
}

- (int) getParams: (NSString*) name {
	NSString *s = [params objectForKey:name];
	int r = [s intValue];
	return r;
}

@end