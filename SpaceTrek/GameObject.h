//
//  GameObject.h
//  SpaceTrek
//
//  Created by huang yongke on 13-10-12.
//  Copyright 2013年 huang yongke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"

@interface GameObject : CCSprite {
    GameObjectType  type;
    int score;
}

@property (nonatomic, readwrite) GameObjectType type;
@property (nonatomic, readwrite) int score;
//@property (nonatomic, readwrite) CGRect posRect;
@end
