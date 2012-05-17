//
//  HomeMenuLayer.h
//  Beat Flick Beta 0.1
//
//  Created by KMO on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SceneCamilo.h"

@interface HomeMenuLayer : CCLayer
{
    CCSprite * bgHome;
    int activeChildLayer;
}

@property (nonatomic,retain) CCSprite *bgHome;
@property (nonatomic) int activeChildLayer;

@end
