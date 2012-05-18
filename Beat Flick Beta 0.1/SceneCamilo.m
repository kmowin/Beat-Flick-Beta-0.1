//
//  SceneCamilo.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 11/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneCamilo.h"


enum {
    tagPlayLayer,
    tagPhotosLayer,
    tagMusicLayer,
    tagVideosLayer,
    tagTopMenuLayer,
    tagOptionsMenuLayer,
    tagHomeMenuLayer
};

@implementation SceneCamilo
// 
- (id)init
{
    self = [super init];
    if (self != nil) 
    {
        menuLayers = [[CCArray alloc] init];
        
        topMenuLayer = [TopMenuLayer node];
        CGSize titleSize = {480, 45};
        [topMenuLayer setContentSize:titleSize];
        [topMenuLayer setPosition:ccp(0, 275)];
        [self addChild:topMenuLayer z:0 tag:tagTopMenuLayer];
        optionsMenuLayer = [OptionsMenuLayer node];
        CGSize optionsSize = {100, 275};
        [optionsMenuLayer setContentSize:optionsSize];
        [optionsMenuLayer setPosition:ccp(-190,-20)];
        [self addChild:optionsMenuLayer z:0 tag:tagOptionsMenuLayer];
        [optionsMenuLayer createMenu];
        homeMenuLayer = [HomeMenuLayer node];
        CGSize homeSize = {380, 275};
        [homeMenuLayer setContentSize:homeSize];
        [homeMenuLayer setPosition:ccp(100, 0)];
        [menuLayers addObject:homeMenuLayer];
        [self addChild:homeMenuLayer z:1 tag:tagHomeMenuLayer];
        playLayer = [PlayLayer node];
        [playLayer setContentSize:homeSize];
        [playLayer setPosition:ccp(100, 0)];
        [menuLayers addObject:playLayer];
        [self addChild:playLayer z:0 tag:tagPlayLayer];
        photosLayer = [PhotosLayer node];
        [photosLayer setContentSize:homeSize];
        [photosLayer setPosition:ccp(100, 0)];
        [menuLayers addObject:photosLayer];
        [self addChild:photosLayer z:0 tag:tagPhotosLayer];
        musicLayer = [MusicLayer node];
        [musicLayer setContentSize:homeSize];
        [musicLayer setPosition:ccp(100, 0)];
        [menuLayers addObject:musicLayer];
        [self addChild:musicLayer z:0 tag:tagMusicLayer];
        videosLayer = [VideosLayer node];
        [videosLayer setContentSize:homeSize];
        [videosLayer setPosition:ccp(100, 0)];
        [menuLayers addObject:videosLayer];
        [self addChild:videosLayer z:0 tag:tagVideosLayer];

    }
    
    return self;
}


-(void) selectedOptionMenu: (CCMenuItemImage*) item
{
    int temporal = item.tag;
    [self selectedOptionTag:temporal];
}
    
-(void) selectedOptionTag: (int) tag
{
    int option = tag;
    int activeTag;
    CCLayer *activeLayer;
    CCLayer *parentLayer;
    for(int i=0; i < menuLayers.count; i++)
    {
        activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
        if(activeLayer.zOrder == 1)
        {
            activeTag = activeLayer.tag;
            if(activeLayer.tag != option)
            {
                [self reorderChild:activeLayer z:2];
                parentLayer = activeLayer;
            }
        }
    }
    
    if(option != activeTag)
    {
        switch (option) {
            case tagPlayLayer:
                playLayer.activeChildLayer = activeTag;
                for(int i=0; i < menuLayers.count; i++)
                {
                    activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
                    if(activeLayer != parentLayer && activeLayer != playLayer)
                        [self reorderChild:activeLayer z:0];
                }
                [playLayer setPosition:ccp(100, 0)];
                [self reorderChild:playLayer z:1];

                break;
            case tagPhotosLayer:
                photosLayer.activeChildLayer = activeTag;
                for(int i=0; i < menuLayers.count; i++)
                {
                    activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
                    if(activeLayer != parentLayer && activeLayer != photosLayer)
                        [self reorderChild:activeLayer z:0];
                }                
                [photosLayer setPosition:ccp(100, 0)];
                [self reorderChild:photosLayer z:1];

                break;
            case tagMusicLayer:
                musicLayer.activeChildLayer = activeTag;
                for(int i=0; i < menuLayers.count; i++)
                {
                    activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
                    if(activeLayer != parentLayer && activeLayer != musicLayer)
                        [self reorderChild:activeLayer z:0];
                }
                [musicLayer setPosition:ccp(100, 0)];
                [self reorderChild:musicLayer z:1];

                break;
                case tagVideosLayer:
                videosLayer.activeChildLayer = activeTag;
                for(int i=0; i < menuLayers.count; i++)
                {
                    activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
                    if(activeLayer != parentLayer && activeLayer != videosLayer)
                        [self reorderChild:activeLayer z:0];
                }
                [videosLayer setPosition:ccp(100, 0)];
                [self reorderChild:videosLayer z:1];
            
                break;
        };
        [self runAnimationLayer:parentLayer];
    }
}

-(void) runAnimationLayer: (CCLayer *) activeLayer
{
    id move = [CCMoveTo actionWithDuration:0.3 position:ccp(480,0)];
    [activeLayer runAction:move];
}

-(void) goHome
{
    CCLayer *activeLayer;
    for(int i=0; i < menuLayers.count; i++)
    {
        activeLayer = (CCLayer *)[menuLayers objectAtIndex: i];
        if(activeLayer != homeMenuLayer)
            [self reorderChild:activeLayer z:0];
    }
    [homeMenuLayer setPosition:ccp(100, 0)];
    [self reorderChild:homeMenuLayer z:1];
}

-(void)onEnterTransitionDidFinish
{
    [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
}

-(void)onExit
{
    [[CCTouchDispatcher sharedDispatcher] removeAllDelegates];
}

- (void)dealloc
{
    CCLOG(@"dealloc: %@", self);
    [super dealloc];
}

@end
