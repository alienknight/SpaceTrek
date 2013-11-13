//
//  GameScene.m
//  SpaceTrek
//
//  Created by huang yongke on 13-10-2.
//  Copyright 2013年 huang yongke. All rights reserved.
//

#import "GameScene.h"
#import "GameLayer.h"
#import "GameLayer2.h"
#import "GameLayer3.h"
#import "BackgroundLayer.h"
#import "PauseLayer.h"
#import "Constants.h"
#import "HUDLayer.h"

@implementation GameScene


static GameScene* instanceOfGameScene;

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
    GameScene *layer = [GameScene node];
    [scene addChild:layer z:1];
    
    HUDLayer *hudLayer = [HUDLayer node];
	// add layer as a child to scene
	[scene addChild: hudLayer z:3 tag:HUD_LAYER_TAG];
    
   	// 'layer' is an autorelease object.
    
	GameLayer *gameLayer = [GameLayer node];
    
	// add layer as a child to scene
	[scene addChild: gameLayer z:1];
    
    return scene;
}


-(id) init
{
	if( (self=[super init])) {
        instanceOfGameScene = self;
        [self setShowingPausedMenu:NO];
    }
    return self;
}

+(CCScene *) sceneWithState:(int)state {
    // 'scene' is an autorelease object.
    
	CCScene *scene = [CCScene node];
    GameScene *layer = [GameScene node];
    [scene addChild:layer z:3];
    
    switch (state)
    {
        case GAME_STATE_ONE:
        {
            BackgroundLayer *backgroundLayer = [[BackgroundLayer alloc] initWithLevel: 1];
            [scene addChild:backgroundLayer z:-1 tag:BACKGROUND_LAYER_TAG];
            
            HUDLayer *hudLayer = [[HUDLayer node] init];
            // add layer as a child to scene
            [scene addChild: hudLayer z:3 tag:HUD_LAYER_TAG];
            
            // 'layer' is an autorelease object.
            GameLayer *gameLayer = [GameLayer node];
            // add layer as a child to scene
            [scene addChild: gameLayer z:1];
            
            
            break;
        }
        case GAME_STATE_TWO:
        {
            BackgroundLayer *backgroundLayer = [[BackgroundLayer alloc] initWithLevel: 2];
            [scene addChild:backgroundLayer z:-1 tag:BACKGROUND_LAYER_TAG];
            
            HUDLayer *hudLayer = [[HUDLayer node] init];
            // add layer as a child to scene
            [scene addChild: hudLayer z:3 tag:HUD_LAYER_TAG];
            
            // 'layer' is an autorelease object.
            GameLayer2 *gameLayer = [GameLayer2 node];
            // add layer as a child to scene
            [scene addChild: gameLayer z:1];
            
            
            break;
        }
        case GAME_STATE_THREE:
        {
            BackgroundLayer *backgroundLayer = [[BackgroundLayer alloc] initWithLevel: 3];
            [scene addChild:backgroundLayer z:-1 tag:BACKGROUND_LAYER_TAG];
            
            HUDLayer *hudLayer = [[HUDLayer node] init];
            // add layer as a child to scene
            [scene addChild: hudLayer z:3 tag:HUD_LAYER_TAG];
            
            // 'layer' is an autorelease object.
            GameLayer3 *gameLayer = [GameLayer3 node];
            // add layer as a child to scene
            [scene addChild: gameLayer z:1];
            
            
            break;
        }
        default:
            
            break;
    }
	return scene;
}

- (void)showPausedMenu {
    PauseLayer *pauzy = [[PauseLayer alloc] initWithLevel: 1];
    
    [self addChild:pauzy z:1 tag:PAUSE_LAYER_TAG];
}


+ (GameScene *) sharedGameScene
{
	return instanceOfGameScene;
}

@end
