//
//  ScoreScene.h
//  Beetles
//
//  Created by DrMike on 29/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

#define GOOD_BUGS_PRESSER @"752122" 
#define ADVANCED_BUGS_DESTROYER @"752132" 
#define PROMISING_COCROACH_LIQUIDATOR @"752142" 
#define SUCCESSFUL_MURDERER_OF_INSECTS @"752152" 
#define EXCELLENT_BUGS_KILLER___ @"752162" 

@interface ScoreScene : CCScene {
	//ScoreLayer *pLayer;
} 
@end


@interface ScoreLayer : CCLayer{
	NSMutableDictionary* plistScore;	
	NSString *filePath;
	int currScore;
	int minScore;
	CCSprite* bg;
	CCLabelAtlas* scorelab;	
	CCLabelAtlas* scorenamelab;		
	UIAlertView *myAlertView;
	UITextField *myTextField;
}

@property (nonatomic, retain) UITextField *myTextField;

- (void) input_name;
- (void) readScoreList;
- (void) sctick:(ccTime) dt;
@end