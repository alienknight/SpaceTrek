//
//  HUDLayer.h
//  SpaceTrek
//
//  Created by huang yongke on 13-10-19.
//  Copyright 2013年 huang yongke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "GameLayer.h"

@interface HUDLayer : CCLayer {
    CCLabelTTF *distanceLabel;
    CCSprite *statusBar;
    GameLayer *gameLayer;
    CCMenuItemImage* property1, *property2, *property3, *property4, *property5, *propertyNull;
    CCMenu *PropertyMenu;
    CCMenuItemSprite *pauseButton;
    CCMenu *pauseMenu;
}
-(void) updateDistanceCounter:(int)amount;

+(HUDLayer*) getHUDLayer;

@end