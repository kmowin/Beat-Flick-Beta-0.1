//
//  HelloWorldLayer.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 10/05/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "AppDelegate.h"
#import "SceneMark.h"
#import "SceneCamilo.h"


enum {
    mark,
    camilo
};

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene {
    // 'scene' is autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'HelloWorldLayer' is an autorelease object.
    HelloWorldLayer *layer = [HelloWorldLayer node];
    
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
        self.isTouchEnabled = YES;
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

        
        // create and initialize our seeker sprite, and add it to this layer
        CCSprite *sceneMarkB = [CCSprite spriteWithFile: @"button_mark.png"];
        sceneMarkB.position = ccp( sceneMarkB.contentSizeInPixels.width, size.height/2 );
        [self addChild:sceneMarkB z:1 tag:mark];
        
        // do the same for our cocos2d guy, reusing the app icon as its image
        CCSprite *sceneCamiloB = [CCSprite spriteWithFile: @"button_camilo.png"];
        sceneCamiloB.position = ccp( size.width - sceneCamiloB.contentSizeInPixels.width, size.height/2 );
        [self addChild:sceneCamiloB z:2 tag:camilo];

        
	}
	return self;
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    CCNode *spriteMark = [self getChildByTag:mark];
    CCNode *spriteCamilo = [self getChildByTag:camilo];
	if (CGRectContainsPoint([spriteMark boundingBox], location)) {
        [self sceneMark];
    }
    
    if (CGRectContainsPoint([spriteCamilo boundingBox], location)) {
        [self sceneCamilo];
    }
}

-(void)sceneMark
{
    [[CCDirector sharedDirector] replaceScene:[SceneMark node]];
}

-(void)sceneCamilo
{
    [[CCDirector sharedDirector] replaceScene:[SceneCamilo node]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
