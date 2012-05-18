//
//  OptionsMenuLayer.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OptionsMenuLayer.h"

enum {
    play,
    photos,
    music,
    videos
};

@implementation OptionsMenuLayer

- (id) init 
{
    if((self = [super init]))
    {

    }
    return self;
}

- (void) createMenu
{
    SceneCamilo *parentScene = (SceneCamilo *)self.parent;
    
    CCMenuItemImage *playGameButton = [CCMenuItemImage itemFromNormalImage:@"buttonPlay.png" selectedImage:@"buttonPlayPress.png" target:parentScene selector:@selector(selectedOptionMenu:)];
    playGameButton.tag = play;
    CCMenuItemImage *selectPhotosButton = [CCMenuItemImage itemFromNormalImage:@"buttonPhotos.png" selectedImage:@"buttonPhotosPress.png" target:parentScene selector:@selector(selectedOptionMenu:)];
    selectPhotosButton.tag = photos;
    CCMenuItemImage *selectMusicButton = [CCMenuItemImage itemFromNormalImage:@"buttonMusic.png" selectedImage:@"buttonMusicPress.png" target:parentScene selector:@selector(selectedOptionMenu:)];
    selectMusicButton.tag = music;
    CCMenuItemImage *selectVideosButton = [CCMenuItemImage itemFromNormalImage:@"buttonVideos.png" selectedImage:@"buttonVideosPress.png" target:parentScene selector:@selector(selectedOptionMenu:)];       
    selectVideosButton.tag = videos;
    CCMenu *menu = [CCMenu menuWithItems:playGameButton, selectPhotosButton, selectMusicButton, selectVideosButton, nil];
    [menu alignItemsVerticallyWithPadding:10];
    [self addChild:menu];
}


@end
