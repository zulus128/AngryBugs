//
//  AnimScene.h
//  Beetles
//
//  Created by вадим on 6/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"


@interface AnimScene : CCScene {
} 
@end

@interface AnimLayer : CCLayer{
	CCSprite* spr;
	CCSprite* spr1;
	CCSprite* bg;
	CCSprite* palec;
	id anm1;
	CCSpriteBatchNode* mgr2;
//	id move1;
//	id palecanm;
	id anim7;
}

- (void) ukusCallback;
- (void) palecCallback;
- (void) endCallback;

- (void) ukusPlayCallback;
- (void) palecPlayCallback;

- (void) movePlayCallback; 
- (void) moveStopCallback; 
@end