//
//  PlayLayer.h
//  Beat Flick Beta 0.1
//
//  Created by KMO on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SceneCamilo.h"

@interface PlayLayer : CCLayer
{
    CCSprite * bgPlay;
    int activeChildLayer;
}

@property (nonatomic,retain) CCSprite *bgPlay;
@property (nonatomic) int activeChildLayer;

@end
