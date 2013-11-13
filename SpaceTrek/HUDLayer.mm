//
//  HUDLayer.mm
//  SpaceTrek
//
//  Created by huang yongke on 13-10-19.
//  Copyright 2013年 huang yongke. All rights reserved.
//

#import "HUDLayer.h"
#import "GameScene.h"
#import <vector>
#import "Global.h"

@implementation HUDLayer

int hudLevel;

+(HUDLayer*) getHUDLayer {
    return self;
}

-(id) init
{
	if ((self = [super init]))
	{
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.tag=HUD_LAYER_TAG;
        statusBar= [CCSprite spriteWithFile:@"StatusBar.png"];
        statusBar.position = ccp(45, winSize.height/2);
        
        distanceLabel = [CCLabelTTF labelWithString:@"0" fontName:@"arial" fontSize:35];
        distanceLabel.rotation = 90;
        [distanceLabel setColor:ccORANGE];
        [distanceLabel setAnchorPoint:ccp(0.5f,1)];
        [distanceLabel setPosition:ccp(63, 100)];
        
        [self addProperty];
        
        [self addChild:statusBar z:2];
        [statusBar addChild:distanceLabel z:30];
     
        
        
        CCSprite * aa= [CCSprite spriteWithFile:@"background-shadow.png"];
        [aa setAnchorPoint: ccp(0,0)];
        [aa setPosition: ccp(0, 0)];
        [self addChild:aa z:1];
        
        pauseButton = [CCMenuItemImage itemWithNormalImage:@"Button-Pause-icon-modified.png" selectedImage:@"Button-Pause-icon-modified.png" target:self selector:@selector(pauseButtonSelectedCur)];
        pauseButton.scale = 0.8;
        pauseButton.rotation = 90;
        
        pauseMenu = [CCMenu menuWithItems:pauseButton, nil];
        pauseMenu.position=ccp(980, 700);
        
        [pauseMenu alignItemsVerticallyWithPadding:10.0f];
        [self addChild:pauseMenu z:2];

   }
    return self;
}

-(void) updateDistanceCounter:(int)amount
{
    NSString *amounts = [NSString stringWithFormat:@"%d", (int)amount];
    [distanceLabel setString:amounts];
}

-(void)addProperty
{
    PropertyMenu = [CCMenu menuWithItems: nil];
    std::set<int>::iterator it;
    int num = 0;
    for (it=purcharsedProperty.begin(); it!=purcharsedProperty.end(); ++it)
    {
        
        switch (*it) {
            case 1:
                property1 = [CCMenuItemImage itemWithNormalImage:@"TOOLBAR_SHIELD_2TIMES.png" selectedImage:@"TOOLBAR_SHIELD_2TIMES.png" target:self selector:@selector(propertySelected1)];
                property1.tag = TREASURE_PROPERTY_TYPE_1_TAG;
                [PropertyMenu addChild:property1];
                num++;
                break;
            case 2:
                property2 = [CCMenuItemImage itemWithNormalImage:@"TOOLBAR_Invincible15s.png" selectedImage:@"TOOLBAR_Invincible15s.png" target:self selector:@selector(propertySelected2)];
                property2.tag = TREASURE_PROPERTY_TYPE_2_TAG;
                [PropertyMenu addChild:property2];
                num++;
                break;
            case 3:
                property3 = [CCMenuItemImage itemWithNormalImage:@"TOOLBAR_Magnet.png" selectedImage:@"TOOLBAR_Magnet.png" target:self selector:@selector(propertySelected3)];
                property3.tag = TREASURE_PROPERTY_TYPE_3_TAG;
                [PropertyMenu addChild:property3];
                num++;
                break;
            case 4:
                property4 = [CCMenuItemImage itemWithNormalImage:@"TOOLBAR_Bullet.png" selectedImage:@"TOOLBAR_Bullet.png" target:self selector:@selector(propertySelected4)];
                property4.tag = TREASURE_PROPERTY_TYPE_4_TAG;
                [PropertyMenu addChild:property4];
                num++;
                break;
            default:
                break;
        }
        
    }
    
    for (int i=0; i<5-num; i++){
        propertyNull = [CCMenuItemImage itemWithNormalImage:@"TOOLBAR_empty.png" selectedImage:@"TOOLBAR_empty.png" target:self selector:@selector(propertySelectedNull)];
        propertyNull.tag = TREASURE_PROPERTY_TYPE_4_NULL;
        [PropertyMenu addChild:propertyNull];
    }
    
    //[PropertyMenu setAnchorPoint: ccp(0.0f, 1.0f)];
    //[PropertyMenu setPosition:ccp(46, 443)];
    
    //[PropertyMenu setAnchorPoint: ccp(-10.0f, 10.0f)];
    [PropertyMenu setPosition:ccp(46, 385)];
    
    [PropertyMenu alignItemsVerticallyWithPadding:8.5f];
    [self addChild:PropertyMenu z:3];
}

-(void) propertySelected1
{
    CCScene* scene = [[CCDirector sharedDirector] runningScene];
    GameLayer* layer = (GameLayer*)[scene getChildByTag:GAME_LAYER_TAG];
    bool used = [layer propertyListener:property1.tag];
    if ( used ){
        [PropertyMenu removeChild:property1];
        purcharsedProperty.erase(1);
    }
}

-(void) propertySelected2
{
    CCScene* scene = [[CCDirector sharedDirector] runningScene];
    GameLayer* layer = (GameLayer*)[scene getChildByTag:GAME_LAYER_TAG];
    bool used = [layer propertyListener:property2.tag];
    if ( used ){
        [PropertyMenu removeChild:property2];
        purcharsedProperty.erase(2);
    }
}

-(void) propertySelected3
{
    CCScene* scene = [[CCDirector sharedDirector] runningScene];
    GameLayer* layer = (GameLayer*)[scene getChildByTag:GAME_LAYER_TAG];
    bool used = [layer propertyListener:property3.tag];
    if ( used ){
        [PropertyMenu removeChild:property3];
        purcharsedProperty.erase(3);
    }
}

-(void) propertySelected4
{
    CCScene* scene = [[CCDirector sharedDirector] runningScene];
    GameLayer* layer = (GameLayer*)[scene getChildByTag:GAME_LAYER_TAG];
    bool used = [layer propertyListener:property4.tag];
    if ( used ){
        [PropertyMenu removeChild:property4];
        purcharsedProperty.erase(4);
    }
}

-(void) propertySelectedNull
{
}

-(void) pauseButtonSelectedCur
{
    CCScene* scene = [[CCDirector sharedDirector] runningScene];
    GameLayer* layer = (GameLayer*)[scene getChildByTag:GAME_LAYER_TAG];
    [layer pauseButtonSelected];
}

@end