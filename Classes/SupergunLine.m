//
//  SupergunLine.m
//  Beetles
//
//  Created by вадим on 6/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SupergunLine.h"


@implementation SupergunLine

- (id) initWithLayerXYR: (CCLayer*) layer x:(int) x y:(int) y rate:(int) rate{
	self = [super init];
	if(self != nil) {
		X = x; Y = y;
		
		for(int i = 0; i < sgparts; i++){
			lfn[i] = [[CCSprite spriteWithFile:@"line swatter kusochek.png"]retain];
			[lfn[i] setPosition:ccp(X + i * (lfn[i].texture.contentSize.width * 0.7), Y)];
			[layer addChild:lfn[i] z:0];	
		}
		
		
		[self refresh:rate];
	}
	return self;
}

- (void) refresh: (int)rate {
	int cnt = rate * sgparts / 100;
	
	for(int i = 0; i < cnt; i++)
		lfn[i].visible = YES;
	for(int i = cnt; i < sgparts; i++)
		lfn[i].visible = NO;
}

- (void) dealloc{
	
	for(int i = 0; i < sgparts; i++)
		[lfn[i] release];
	
	[super dealloc];
	
}

@end
