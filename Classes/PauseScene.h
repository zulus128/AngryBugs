//
//  PauseScene.h
//  Beetles
//
//  Created by вввв ввв on 6/15/09.
//  Copyright 2009 ввв. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"


@interface PauseScene : CCScene {

} 

@end

@interface PauseLayer : CCLayer{

}

- (void) continueCallback:(id) sender;
- (void) musikCallback:(id) sender;
- (void) soundCallback:(id) sender;
- (void) sfxCallback:(id) sender;

@end
