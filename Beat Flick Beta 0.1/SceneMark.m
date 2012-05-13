//
//  SceneMark.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 11/05/2012.
//  Modified by Mark on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneMark.h"
#import "cocos2d.h"
enum {
    testB,
    testB2
};

@implementation SceneMark

+(CCScene *) scene {
    // 'scene' is autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'HelloWorldLayer' is an autorelease object.
    SceneMark *layer = [SceneMark node];
    
    // add layer as a child to scene
    [scene addChild:layer];
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    // always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {  
            
        CGSize size = [[CCDirector sharedDirector] winSize];
        //create the background
        
        // background
		ccTexParams params = {GL_LINEAR,GL_LINEAR,GL_REPEAT, GL_REPEAT};
		CCSprite *bg = [CCSprite spriteWithFile:@"background_1282.png" rect:CGRectMake(0, 0, size.width, size.height)];
		bg.position = ccp(size.width /2 , size.height /2); // center sprite
		[bg.texture setTexParameters:&params];
		[self addChild:bg z:0];
        
        
        // create the "Button" button!
        CCSprite *testButton = [CCSprite spriteWithFile: @"button_test.png"];
        testButton.position = ccp( testButton.contentSizeInPixels.width, size.height/4 );
        [self addChild:testButton z:1 tag:testB];
	
   // CCSpriteSheet spritesheet = [CCSpriteSheet spriteSheetWithFile:@"jay_walk.png"];
        
        
    }
	return self;
}

    //release all retained objects
    - (void) dealloc
    {

        // don't forget to call "super dealloc"
        [super dealloc];
    }
    

@end
