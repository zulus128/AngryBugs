//
//  SplashScene.m
//  Beetles
//
//  Created by вадим on 6/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SplashScene.h"
#import "GameScene1.h"
#import "MenuScene.h"
#import "AnimScene.h"
#import "Common.h"

#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation SplashScene
- (id) init {
	self = [super init];
	if(self !=nil) {
		
		CCSprite* bg = [CCSprite spriteWithFile:@"splash.png"];
		bg.position = ccp(240, 160);
		//bg.autoCenterFrames = YES;
		[self addChild:bg z:1];		
		
		[self addChild:[SplashLayer node] z:0];
		
	}
	return self;
}

@end

@implementation SplashLayer
- (id) init {
	self = [super init];
	if(self != nil) {
		
		isTouchEnabled = YES;
		cnt = 0;
		[self schedule: @selector(tick:) interval:0.5];
		
	}
	return self;
}

- (void) tick:(ccTime) dt {
	if(cnt == 1){
		[self unschedule: @selector(tick:)];
/*		
		mach_port_t host_port;
		mach_msg_type_number_t host_size;
		vm_size_t pagesize;
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		vm_statistics_data_t vm_stat;
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			NSLog(@"Failed to fetch vm statistics");
			//return 0;
		} else {
		natural_t mem_free = vm_stat.free_count * pagesize;		
		NSLog(@"User memory: %.2fMB", mem_free/1024.0f/1024.0f);
			double t = mem_free/1024.0f/1024.0f;
			if(t < 43) {
			int tt = 3;
				NSLog(@"Trying to allocate %d megs",tt);
			size_t size = tt * 1024 * 1024;
			void *allocation = malloc(mem_free - tt * 1024 * 1024);
			bzero(allocation, size);
			free(allocation);
			}
		}
		
		//[NSThread sleepForTimeInterval:0.1f];
		
		host_port = mach_host_self();
		host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
		host_page_size(host_port, &pagesize);
		//vm_statistics_data_t vm_stat;
		if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
			NSLog(@"Failed to fetch vm statistics");
			//return 0;
		} else {
			natural_t mem_free = vm_stat.free_count * pagesize;		
			NSLog(@"User memory: %.2fMB", mem_free/1024.0f/1024.0f);
		}*/
		
		[Common instance].gamescene = [GameScene1 node];
		
		//[NSThread sleepForTimeInterval:0.8f];

		[Common instance].menuscene = [MenuScene node];
		[Common instance].animscene = [AnimScene node];


		//[NSThread sleepForTimeInterval:0.8f];
//		[Common instance].scorescene = [ScoreScene node];
		[self schedule: @selector(tick:) interval:0.5f];
	}
	
	if (cnt++ >= 4) {
		[self unschedule: @selector(tick:)];
//		[[Director sharedDirector] replaceScene:[Common instance].gamescene];	
//		[[Director sharedDirector] replaceScene:[Common instance].menuscene];	
		[[CCDirector sharedDirector] replaceScene:[Common instance].animscene];	
	}
}
//- (void) onExit {
//	[self dealloc];
//}

- (void) dealloc{
	//NSLog(@"SplashScene dealloc");
	
	[super dealloc];
}

@end
