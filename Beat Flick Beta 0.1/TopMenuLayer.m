//
//  TopMenuLayer.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopMenuLayer.h"

@implementation TopMenuLayer

@synthesize topTitle;

- (id) init 
{
    if((self = [super init])) 
    {
        self.isTouchEnabled = YES;
        topTitle = [CCSprite spriteWithFile:@"topMenu.png"];
        [topTitle setAnchorPoint : ccp(0,0)];
        [self addChild:topTitle];
    }
    return self;
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    SceneCamilo *parentScene = (SceneCamilo *)self.parent;
    CGPoint location = [touch locationInView:[touch view]];
    //location = [parentScene convertToWorldSpace:location];
    location = [[CCDirector sharedDirector] convertToGL:location];

	if (CGRectContainsPoint([self boundingBox], location)) {
        //NSLog(@"entro a bounding Top");
        [parentScene goHome];
        return YES;
    }
    return NO;
}

-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}
@end
