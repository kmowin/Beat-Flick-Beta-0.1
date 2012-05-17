//
//  SceneCamilo.h
//  Beat Flick Beta 0.1
//
//  Created by KMO on 11/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "TopMenuLayer.h"
#import "OptionsMenuLayer.h"
#import "HomeMenuLayer.h"
#import "PlayLayer.h"
#import "PhotosLayer.h"
#import "MusicLayer.h"
#import "VideosLayer.h"

@class TopMenuLayer;
@class OptionsMenuLayer;
@class HomeMenuLayer;
@class PlayLayer;
@class PhotosLayer;
@class MusicLayer;
@class VideosLayer;

@interface SceneCamilo : CCScene <CCStandardTouchDelegate>
{
    TopMenuLayer *topMenuLayer;
    OptionsMenuLayer *optionsMenuLayer;
    HomeMenuLayer *homeMenuLayer;
    PlayLayer *playLayer;
    PhotosLayer *photosLayer;
    MusicLayer *musicLayer;
    VideosLayer *videosLayer;
    CCArray *menuLayers;
    CCArray *hierarchyMenu;
}

-(void) selectedOption:(CCMenuItemImage*) item;

-(void) goHome;

@end
