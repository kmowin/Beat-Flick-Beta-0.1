//
//  PhotosLayer.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotosLayer.h"

@implementation PhotosLayer

@synthesize bgPhotos;
@synthesize activeChildLayer, distance, positionInitial;

- (id) init
{
    if((self = [super init])) 
    {
        self.isTouchEnabled = YES;
        bgPhotos = [CCSprite spriteWithFile:@"windowImage3.png"];
        [bgPhotos setAnchorPoint : ccp(0,0)];
        [self addChild:bgPhotos];
    }
    return self;
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
	if (CGRectContainsPoint([self boundingBox], location)) {
        //NSLog(@"entro a bounding Photos");
        self.distance = location.x - self.position.x;
        self.positionInitial = location.x;
        return YES;
    }
    return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    //NSLog(@"entro a move Play");
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToUI:location];
    location.y = [self position].y;
    location.x = location.x - distance;
    [self setPosition:location];
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    SceneCamilo *parentScene = (SceneCamilo *)self.parent;
    CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToUI:location];
    CGSize size = [[CCDirector sharedDirector] winSize];
    int finalDistance = location.x - self.positionInitial;
    if(size.width/3 > finalDistance)
    {
        id move = [CCMoveTo actionWithDuration:0.3 position:ccp(100,0)];
        [self runAction:move];
    }
    else {
        [parentScene selectedOptionTag:self.tag+1];
    }
}

-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

@end
