//
//  LifeLine.h
//  Beetles
//
//  Created by вадим on 6/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

#define shparts 38

@interface LifeLine : NSObject {
	CCSprite* lfn[shparts];
	int X, Y;
}
- (id) initWithLayerXYR: (CCLayer*) layer x:(int) x y:(int) y rate:(int) rate;
- (void) refresh: (int)rate;

@end
