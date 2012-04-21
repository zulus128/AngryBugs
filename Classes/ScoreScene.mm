//
//  ScoreScene.m
//  Beetles
//
//  Created by DrMike on 29/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ScoreScene.h"
#import "GameScene1.h"
#import "Common.h"
#import "OpenFeint.h"
#import "OFHighScoreService.h"
#import "OFAchievement.h"

@implementation ScoreScene
- (id) init{
	self = [super init];
	if(self !=nil) {
		[self addChild:[ScoreLayer node] z:0];
	}
	return self;
}
@end

@implementation ScoreLayer

@synthesize myTextField;

- (id) init {
	self = [super init];
	if(self != nil) {
		
		isTouchEnabled = YES;
		
		int scor = [Common instance].score;
		
		[OFHighScoreService setHighScore:scor  
						  forLeaderboard:@"595494"    
							   onSuccess:OFDelegate()    
							   onFailure:OFDelegate()];
		
		//[OFAchievementService unlockAchievement:DEXTEROUS_HUNTER];
		
		if(scor < 20000) {
			
			double s = (double)scor / 20000 * 100;
			//NSLog(@"s=%f",s);
			[[OFAchievement achievement:GOOD_BUGS_PRESSER] updateProgressionComplete: s andShowNotification: YES];
			
		} else
			if(scor < 40000) {
				
				double s = (double)(scor - 20000) / 20000 * 100;
				[[OFAchievement achievement:GOOD_BUGS_PRESSER] updateProgressionComplete: 100.0f andShowNotification: NO];
				[[OFAchievement achievement:ADVANCED_BUGS_DESTROYER] updateProgressionComplete: s andShowNotification: YES];
				
			} else
				if(scor < 60000) {
				
					double s = (double)(scor - 40000)/ 20000 * 100;
					[[OFAchievement achievement:GOOD_BUGS_PRESSER] updateProgressionComplete: 100.0f andShowNotification: NO];
					[[OFAchievement achievement:ADVANCED_BUGS_DESTROYER] updateProgressionComplete: 100.0f andShowNotification: NO];
					[[OFAchievement achievement:PROMISING_COCROACH_LIQUIDATOR] updateProgressionComplete: s andShowNotification: YES];
				
				} else
					if(scor < 80000) {
						
						double s = (double)(scor - 60000)/ 20000 * 100;
						[[OFAchievement achievement:GOOD_BUGS_PRESSER] updateProgressionComplete: 100.0f andShowNotification: NO];
						[[OFAchievement achievement:ADVANCED_BUGS_DESTROYER] updateProgressionComplete: 100.0f andShowNotification: NO];
						[[OFAchievement achievement:PROMISING_COCROACH_LIQUIDATOR] updateProgressionComplete: 100.0f andShowNotification: NO];
						[[OFAchievement achievement:SUCCESSFUL_MURDERER_OF_INSECTS] updateProgressionComplete: s andShowNotification: YES];
						
					} else
						/*if(scor < 100000)*/ {
							
							double s = (double)(scor - 80000)/ 20000 * 100;
							if(s > 100.0f) s = 100.0f;
							[[OFAchievement achievement:GOOD_BUGS_PRESSER] updateProgressionComplete: 100.0f andShowNotification: NO];
							[[OFAchievement achievement:ADVANCED_BUGS_DESTROYER] updateProgressionComplete: 100.0f andShowNotification: NO];
							[[OFAchievement achievement:PROMISING_COCROACH_LIQUIDATOR] updateProgressionComplete: 100.0f andShowNotification: NO];
							[[OFAchievement achievement:SUCCESSFUL_MURDERER_OF_INSECTS] updateProgressionComplete: 100.0f andShowNotification: NO];
							[[OFAchievement achievement:EXCELLENT_BUGS_KILLER___] updateProgressionComplete: s andShowNotification: YES];
							
						}
		
		
		[OpenFeint launchDashboardWithHighscorePage:@"595494"]; 
		
		
/*		bg = [CCSprite spriteWithFile:@"Score_list.png"];
		bg.position = ccp(240, 160);
		//bg.autoCenterFrames = YES;
		[self addChild:bg z:0];	
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		
		NSString *BuckUpfilePath = [[NSBundle mainBundle] pathForResource:@"score" ofType:@"plist"];
		
		
		filePath = [documentsDirectory stringByAppendingPathComponent:@"score.plist"];
		BOOL myPathDir;
		BOOL fileExists = [[NSFileManager defaultManager]
						fileExistsAtPath:filePath
						isDirectory: &myPathDir];
		
		if (!fileExists)
		{
			[[NSFileManager defaultManager] 
						   copyItemAtPath:BuckUpfilePath toPath:filePath error:nil];
		}
		plistScore = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];		
		for (int i = 1; i <= 10 ; i++) {
			
			NSString *str = @"1234567890";//[NSString stringWithFormat:@"%06d",0];
			scorelab = [[CCLabelAtlas labelAtlasWithString:str charMapFile:@"high_score_number.png" itemWidth:15 itemHeight:17 startCharMap:'0'] retain];
			scorelab.position = ccp(350,232-20*i);
			scorelab.visible = YES;		
			[self addChild:scorelab z:1];
			
			NSString *num_tmp = [NSString stringWithFormat:@"s%d", i];
			NSString *s = [[plistScore objectForKey:num_tmp]objectForKey:@"score"];
			int scr = [s intValue];
			NSString* scr_str = [NSString stringWithFormat:@"%d", scr];
			[scorelab setString:scr_str];
			
			//------------------------------ABCDEFGHIJKLMNOPQRSTUVWXYZ
			NSString *str1 = @"abcdefghijklmnopqrstuvwxyz";//[NSString stringWithFormat:@"%06d",0]; 
			scorenamelab = [[CCLabelAtlas labelAtlasWithString:str1 charMapFile:@"score_chars.png" itemWidth:15 itemHeight:17 startCharMap:'a'] retain];
			scorenamelab.position = ccp(50,232-20*i);
			scorenamelab.visible = YES;		
			[self addChild:scorenamelab z:2];
			
			s = [[plistScore objectForKey:num_tmp]objectForKey:@"name"];
			NSString *nam = [s lowercaseString];
			[scorenamelab setString:nam];
		}
		NSString *s = [[plistScore objectForKey:@"s10"]objectForKey:@"score"];
		minScore = [s intValue];
		[self input_name];*/
	}
	return self;
}

- (void) readScoreList{
/*for (int i = 1; i <= 10 ; i++) {	
	NSString *str = [NSString stringWithFormat:@"%06d",0];
	NSString *num_tmp = [NSString stringWithFormat:@"s%d", i];
	NSString *s = [[plistScore objectForKey:@"s1"]objectForKey:@"name"];
	NSString *nam = s;
	
	s = [[plistScore objectForKey:num_tmp]objectForKey:@"score"];
	int scr = [s intValue];
	
	
	NSString* scr_str = [NSString stringWithFormat:@"%d", scr];
	[scorelab setString:scr_str];
	[scorenamelab setString:nam];
}	*/
}



-(void)ccTouchesBegan:(NSSet* )touches withEvent:(UIEvent* )event{
	
	//[self input_name];
	[[CCDirector sharedDirector] replaceScene:[Common instance].menuscene];
	return;// kEventHandled;
}


-(void) alertView: (UIAlertView *)actionSheet clickedButtonAtIndex: (NSInteger) buttonIndex{
	if(buttonIndex > 0) {
		//NSLog(@"name entered %d", [Common instance].score);
		NSString *textValue = myTextField.text;
		[textValue lowercaseString];
		NSString *selected_key;
		int selected_index = 0;
		for (int i = 1; i <= 10 ; i++) 
		{
			NSString *num_tmp = [NSString stringWithFormat:@"s%d", i];
			NSString *s = [[plistScore objectForKey:num_tmp]objectForKey:@"score"];		
			s = [[plistScore objectForKey:num_tmp]objectForKey:@"score"];
			int scr = [s intValue];
			//if([Common instance].score && (scr > [Common instance].score))
			if(currScore && (scr < currScore))
			{
				selected_key = [NSString stringWithFormat:@"s%d",i];//!
				selected_index = i;//!
				break;
			}
		}
		
		if(selected_key)
		{
			if([selected_key isEqualToString:@"s0"]) {
				selected_key = [NSString stringWithFormat:@"s%d",1];
				selected_index = 1;
			}
			
			for (int i = 10 ; i > selected_index; i--) {
				NSString *num_tmp1 = [NSString stringWithFormat:@"s%d", i];
				NSString *num_tmp = [NSString stringWithFormat:@"s%d", i-1];
				[[plistScore objectForKey:num_tmp1] setObject:[[plistScore objectForKey:num_tmp]objectForKey:@"name"] forKey:@"name"];
				[[plistScore objectForKey:num_tmp1] setObject:[[plistScore objectForKey:num_tmp]objectForKey:@"score"] forKey:@"score"];	
			}
			NSString *SCR_TMP = [NSString stringWithFormat:@"%d", currScore];
			[[plistScore objectForKey:selected_key] setObject:textValue forKey:@"name"];
			[[plistScore objectForKey:selected_key] setObject:SCR_TMP forKey:@"score"];		

			//[plistScore 
			//filePath = [[NSBundle mainBundle] pathForResource:@"score" ofType:@"plist"];
			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
			NSString *documentsDirectory = [paths objectAtIndex:0];

			filePath = [documentsDirectory stringByAppendingPathComponent:@"score.plist"];
			[plistScore writeToFile:filePath atomically:YES];
		}
		
		
	}
	[Common instance].scorescene = [ScoreScene node];
	[[CCDirector sharedDirector] replaceScene:[Common instance].scorescene];
	[Common instance].showScore = YES;
}


-(void) input_name{
	
	NSLog(@"input show %d", [Common instance].score);
	currScore = [Common instance].score;
	myAlertView = [[UIAlertView alloc] initWithTitle:@"Enter your name" message:@"---" 
														 delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	//CGRect fr = myAlertView.frame;
	//fr.origin.y -= 100;
	//myAlertView.frame = fr;
	
	myTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 35, 245, 20)];
	[myTextField setBackgroundColor:[UIColor whiteColor]];
	[myAlertView addSubview:myTextField];
	//CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 60.0);
	//[myAlertView setTransform:myTransform];
	[myTextField becomeFirstResponder];
	
	if ([Common instance].score > minScore) {
	[myAlertView show];	
	}
}


-(void) sctick:(ccTime) dt {
	
}
@end
