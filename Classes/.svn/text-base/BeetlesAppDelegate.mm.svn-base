//
//  BeetlesAppDelegate.m
//  Beetles
//
//  Created by вввв ввв on 5/15/09.
//  Copyright ввв 2009. All rights reserved.
//

#import "BeetlesAppDelegate.h"
//#import "Common.h"
#import "OpenFeint.h"
#import "SplashScene.h"

@implementation BeetlesAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setUserInteractionEnabled:YES];
	[window setMultipleTouchEnabled:YES];
	
	//[CCDirector useFastDirector];
	//[[CCDirector sharedDirector] setLandscape:YES];
	[[CCDirector sharedDirector] setDeviceOrientation:CCDeviceOrientationLandscapeLeft];	
	//[[Director sharedDirector] setDisplayFPS:YES];
	[[CCDirector sharedDirector] attachInWindow:window];
	
	[window makeKeyAndVisible];
	
	SplashScene* ss = [SplashScene node];
	[[CCDirector sharedDirector] runWithScene:ss];		
}

// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
//	[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
	[[CCDirector sharedDirector] pause];
	[OpenFeint applicationWillResignActive]; // Add for OpenFeint
	
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	[[CCDirector sharedDirector] resume];
	[OpenFeint applicationDidBecomeActive]; // Add for OpenFeint

}

// purge memroy
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
//	[[TextureMgr sharedTextureMgr] removeAllTextures];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
//	[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
	[[CCDirector sharedDirector] end];
	[[NSUserDefaults standardUserDefaults] synchronize]; // Add for OpenFeint
	
}

- (void) dealloc
{
	[window release];
	[super dealloc];
}

@end
