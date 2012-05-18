//
//  VideosLayer.h
//  Beat Flick Beta 0.1
//
//  Created by KMO on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SceneCamilo.h"

@interface VideosLayer : CCLayer
{
    CCSprite * bgVideos;
    int activeChildLayer, distance, positionInitial;
}

@property (nonatomic,retain) CCSprite *bgVideos;
@property (nonatomic) int activeChildLayer, distance, positionInitial;

@end
