//
//  AngryBugsOFDelegate.m
//  HungryBugs
//
//  Created by вадим on 12/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OpenFeint.h"
#import "AngryBugsOFDelegate.h"
#import "cocos2d.h"
#import "Common.h"

@implementation AngryBugsOFDelegate

- (void)dashboardWillAppear {
	
}

- (void)dashboardDidAppear {
	
	[[CCDirector sharedDirector] pause];
	[[CCDirector sharedDirector] stopAnimation];
}

- (void)dashboardWillDisappear {
	
}

- (void)dashboardDidDisappear {
	
	[[CCDirector sharedDirector] resume];
	[[CCDirector sharedDirector] startAnimation];
	//	 [[CCDirector sharedDirector] replaceScene: [WelcomeScreen scene]];
	[[CCDirector sharedDirector] replaceScene: [Common instance].menuscene];
	
}

- (void)userLoggedIn:(NSString*)userId {
	
	OFLog(@"New user logged in! Hello %@", [OpenFeint lastLoggedInUserName]);
}

- (BOOL)showCustomOpenFeintApprovalScreen {
	
	return NO;
}

@end

