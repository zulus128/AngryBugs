//
//  SplashScene.h
//  Beetles
//
//  Created by вадим on 6/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"


@interface SplashScene : CCScene {
	
} 

@end

@interface SplashLayer : CCLayer{
	int cnt;
}

- (void) tick:(ccTime) dt;

@end