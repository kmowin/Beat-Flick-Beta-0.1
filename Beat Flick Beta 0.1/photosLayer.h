//
//  PhotosLayer.h
//  Beat Flick Beta 0.1
//
//  Created by KMO on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SceneCamilo.h"

@interface PhotosLayer : CCLayer
{
    CCSprite * bgPhotos;
    int activeChildLayer;
}

@property (nonatomic,retain) CCSprite *bgPhotos;
@property (nonatomic) int activeChildLayer;

@end
