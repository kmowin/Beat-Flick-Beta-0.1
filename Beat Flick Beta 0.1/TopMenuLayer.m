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
    NSLog(@"touch began");
    SceneCamilo *parentScene = (SceneCamilo *)self.parent;
    CGPoint location = [self convertTouchToNodeSpace:touch];
    location = [[CCDirector sharedDirector] convertToGL:location];

	if (CGRectContainsPoint([self boundingBox], location)) {
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
