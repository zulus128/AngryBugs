//
//  GameScene1.h
//  Beetles
//
//  Created by вввв ввв on 5/15/09.
//  Copyright 2009 ввв. All rights reserved.
//

#pragma once

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "Beetle.h"
#import "LifeLine.h"
#import "SupergunLine.h"
//#import "SoundSupport.h" //drm

#define BEETLE_NUM_MAX 1000
#define BEETLE_TYPES 15
#define SPECIALS_NUM 6
#define BEETLE_TYPES_WITH_SPECIALS (BEETLE_TYPES + SPECIALS_NUM)

#define MEDBUTTON_X 30
#define MEDBUTTON_Y 240
#define MEDBUTTON_DELAY 10
#define METBUTTON_X 30
#define METBUTTON_Y 180
#define METBUTTON_DELAY 15
#define ROABUTTON_X 30
#define ROABUTTON_Y 120
#define ROABUTTON_DELAY 8
#define FREBUTTON_X 450
#define FREBUTTON_Y 180
#define FREBUTTON_DELAY 12
#define BOOBUTTON_X 450
#define BOOBUTTON_Y 240
#define BOOBUTTON_DELAY 17
#define ELEBUTTON_X 450
#define ELEBUTTON_Y 120
#define ELEBUTTON_DELAY 13

#define DIRKA_CNT 9
#define FORKDIRKA1_X 240
#define FORKDIRKA1_Y 260
#define FORKDIRKA2_X 100
#define FORKDIRKA2_Y 180
#define FORKDIRKA3_X 140
#define FORKDIRKA3_Y 40
#define FORKDIRKA4_X 300
#define FORKDIRKA4_Y 50
#define FORKDIRKA5_X 340
#define FORKDIRKA5_Y 180
#define FORKDIRKA6_X 120
#define FORKDIRKA6_Y 220
#define FORKDIRKA7_X 110
#define FORKDIRKA7_Y 80
#define FORKDIRKA8_X 270
#define FORKDIRKA8_Y 60
#define FORKDIRKA9_X 360
#define FORKDIRKA9_Y 200

#define SPOONSHLEP_CNT 10
#define SPOONSHLEP1_X 40
#define SPOONSHLEP1_Y 180
#define SPOONSHLEP2_X 100
#define SPOONSHLEP2_Y 100
#define SPOONSHLEP3_X 240
#define SPOONSHLEP3_Y 100
#define SPOONSHLEP4_X 400
#define SPOONSHLEP4_Y 170

#define SPOONSHLEP2_1_X 120
#define SPOONSHLEP2_1_Y 280
#define SPOONSHLEP2_2_X 60
#define SPOONSHLEP2_2_Y 180
#define SPOONSHLEP2_3_X 120
#define SPOONSHLEP2_3_Y 80
#define SPOONSHLEP2_4_X 360
#define SPOONSHLEP2_4_Y 280
#define SPOONSHLEP2_5_X 420
#define SPOONSHLEP2_5_Y 180
#define SPOONSHLEP2_6_X 360
#define SPOONSHLEP2_6_Y 80

@class GameLayer1;

@interface GameScene1 : CCScene {
	GameLayer1* child;
}

- (void) load;
//- (void) runTimer;
@end

@interface GameLayer1 : CCLayer{

	CCSpriteBatchNode* mgr;
//	AtlasSpriteManager *mgr1;
	CCSpriteBatchNode* mgr3;
	int selected;
	int levelmaxbugs;
	Beetle*  btl[BEETLE_NUM_MAX];
	
	id anm[BEETLE_TYPES_WITH_SPECIALS];
	id anm1[BEETLE_TYPES_WITH_SPECIALS];	
	int oldx, oldy;
	int ooldx, ooldy;
	int level;
	int lev;
	int smashfactor;
	int smashcnt;
	id zz;
	id iz;
	id zz1;
	id iz1;	
	id gover;
	BOOL endlevel;
	BOOL gameov;
	
	CCSprite* zast;
	CCSprite* zast1;	
	CCSprite* electro;
	CCSprite* ranksprite;
	CCLabelAtlas* levellab;
	CCLabelAtlas* scorelab;	
	CGRect target1;
	CGRect target2;
	CGRect target3;
	CGRect target4;
	CGRect target5;
	CGRect target6;
	CGRect target7;
	CGRect target8;
	CGRect target9;
	CGRect target10;
	CGRect mettarget1;
	CGRect mettarget2;
	CGRect mettarget3;
	CGRect mettarget4;
	CGRect mettarget5;
	CGRect mettarget6;
	CGRect mettarget7;
	CGRect mettarget8;
	CGRect mettarget9;
	CGRect mettarget10;

	CGRect rank1;
	CGRect rank2;
	CGRect rank3;
	CGRect rank4;
	CGRect rank5;
	CGRect rank6;
	CGRect rank7;
	CGRect rank8;
	CGRect rank9;
	CGRect rank10;
	CGRect rank11;
	CGRect rank12;
	CGRect rank13;
	CGRect rank14;
	CGRect rank15;

	CCSprite *sprite;
	CCSprite *psprite;	
	CCSprite *gosprite;
	CCSprite *swsprite;
	
	CCSprite *medbuttonsprite;	
	id medbuttonanim;
	id medbuttonanim1;
	BOOL medallowed;
	BOOL medpressed;
	int doctorlevel;
	//CGRect medbutton1;

	CGRect emptyButton;
	
	CCSprite *metbuttonsprite;	
	id metbuttonanim;
	id metbuttonanim1;
	BOOL metallowed;
	BOOL metpressed;
//	BOOL metal;
	int metlevel;

	CCSprite *roabuttonsprite;	
	id roabuttonanim;
	id roabuttonanim1;
	BOOL roaallowed;
	BOOL roapressed;
	int roalevel;

	CCSprite *frebuttonsprite;	
	id frebuttonanim;
	id frebuttonanim1;
	BOOL freallowed;
	BOOL frepressed;
	int frelevel;

	CCSprite *elebuttonsprite;	
	id elebuttonanim;
	id elebuttonanim1;
	BOOL eleallowed;
	BOOL elepressed;
	int elelevel;

	CCSprite *boobuttonsprite;	
	id boobuttonanim;
	id boobuttonanim1;
	BOOL booallowed;
	BOOL boopressed;
	int boolevel;
	
	CCSprite *swanimsprite;
	CCSprite *swanimsprite1;
	CCSprite *swanimsprite2;
	CCSprite *swanimsprite3;
	//Sprite *swanimsprite;

	CCSprite* bg;
	CCSprite* ll;
	CCSprite* sc;
	
	CCSprite* dirka[DIRKA_CNT];
	CCSprite* spoonshlep[SPOONSHLEP_CNT];
	CGRect forkRect;
	CGRect spoonRect;
	CGRect swatRect;
	
	id fork_anim, fork_anim2, fork_anim2_1, spoon_anim, spoon_anim2, spoon_anim2_1, swat_anim, swat_anim2, swat_anim2_1, swat_anim4, swat_anim4_1, swat_anim4_2;
	id electro_anim;
	id rank_anim;
	int cnt;
	CGRect pause1;
	CGRect pause2;	
	BOOL pause;
	BOOL swatter;
	LifeLine* sline;
	SupergunLine* gline;	
	CGRect swatter1;
	CGRect swatter2;
	CGRect swatter3;
	CGRect swatter4;
	CGRect swatter5;
	CGRect swatter6;
	CGRect swatter7;
	CGRect swatter8;
	int maxonscreen;
	
	BOOL meddone, metdone, roadone, fredone, eledone, boodone;
	CGRect medrect;
	CGRect metrect;
	CGRect elerect;
	CGRect roarect;
	CGRect boorect;
	CGRect frerect;
}

- (void) printmem;

- (void) zastMiddleCallback;
- (void) zastMiddleCallback1;
//- (void) zastEndCallback;
- (void) swatCallback;
- (void) swatCallback2;
- (void) swatCallback4;
- (void) spoonCallback;
- (void) spoonCallback2;
- (void) forkCallback;
- (void) forkCallback2;
- (void) goverCallback;
- (void) goverCallback1;

- (void) medbuttonCallback1;
- (void) medbuttonCallback2;

- (void) metbuttonCallback1;
- (void) metbuttonCallback2;

- (void) roabuttonCallback1;
- (void) roabuttonCallback2;

- (void) boobuttonCallback1;
- (void) boobuttonCallback2;

- (void) frebuttonCallback1;
- (void) frebuttonCallback2;

- (void) elebuttonCallback1;
- (void) elebuttonCallback2;

- (void) pauseCallback:(id) sender;
- (void) tick:(ccTime) dt;
- (void) beginLevel;
- (void) doSmash:(int)i swatter:(BOOL)isswatter spec:(BOOL)isspec;
- (void) save;
- (void) load;
- (void) delet;
//- (void) runTimer;
- (void) forkCallback_0;
- (void) forkCallback_0_1;
- (void) forkCallback_1;
- (void) forkCallback_2;
- (void) forkCallback_3;
- (void) forkCallback_4;
- (void) forkCallback_5;
- (void) forkCallback_6;
- (void) forkCallback_7;
- (void) forkCallback_8;
- (void) forkCallback_9;

- (void) spoonCallback_0;
- (void) spoonCallback_0_1;
- (void) spoonCallback_1;
- (void) spoonCallback_2;
- (void) spoonCallback_3;
- (void) spoonCallback_4;

- (void) spoonCallback2_1;
- (void) spoonCallback2_2;
- (void) spoonCallback2_3;
- (void) spoonCallback2_4;
- (void) spoonCallback2_5;
- (void) spoonCallback2_6;

- (void) swatCallback_0;
- (void) swatCallback_0_1;
- (void) swatCallback_0_2;

- (void) startSpecs;
- (void) stopSpecs;

@end

