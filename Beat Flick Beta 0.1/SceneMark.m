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
        
        //enable touches
        self.isTouchEnabled = YES;
        //get window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"jaywalk2.plist"];
        //create the background (& set the texture to not mipmap and repeat over the quad)
		ccTexParams params = {GL_LINEAR,GL_LINEAR,GL_REPEAT, GL_REPEAT};
		CCSprite *bg = [CCSprite spriteWithFile:@"background_1282.png" rect:CGRectMake(0, 0, size.width, size.height)];
		bg.position = ccp(size.width /2 , size.height /2); // center sprite
		[bg.texture setTexParameters:&params];
		[self addChild:bg z:-1];
        
        NSMutableArray *frames= [[NSMutableArray alloc] init];
        for (int i = 1; i < 9; i++)
        {
            NSString *frameName = [NSString stringWithFormat:@"walk %i.png", i];
            [frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName]];
        }
        
        CCAnimation *a = [CCAnimation animationWithFrames:frames delay:2.0f/24.0f];
        
        //create the Walking Jay
        CCSprite *walkingJay = [CCSprite spriteWithSpriteFrameName:@"walk 1.png"];
        walkingJay.position = ccp( -96, 220 );
        [self addChild:walkingJay z:2 tag:testB];
        
        // create the "Button" button!
        CCSprite *testButton = [CCSprite spriteWithFile:@"button_test.png"];
        testButton.position = ccp( (size.width/2), size.height/3.5 );
        [self addChild:testButton z:1 tag:testB2];
        
        //animate Walking Jay
        CCAnimate *walkanim = [CCAnimate actionWithAnimation:a];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:walkanim];
        [walkingJay runAction:repeat];

        
    }
	return self;
}

//handle the touches
- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    CCNode *testButton = [self getChildByTag:testB2];
    CCNode *walkingJay = [self getChildByTag:testB];

   	if (CGRectContainsPoint([testButton boundingBox], location)) {
        
        //scale and fade the button on press
        [testButton runAction:[CCScaleBy actionWithDuration:.05 scale:0.975]];
        [testButton runAction:[CCFadeTo actionWithDuration:.05 opacity:99]];
        [walkingJay runAction:[CCMoveTo actionWithDuration:7.66 position:ccp(size.width*1.05,220)]];

    }


}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    CCNode *testButton = [self getChildByTag:testB2];
        //scale and fade the button back to original values
        [testButton runAction:[CCScaleTo  actionWithDuration:.05 scale:1]];
        [testButton runAction:[CCFadeIn actionWithDuration:0.1]];
    
}

    
    //release all retained objects
    - (void) dealloc
    {

        // don't forget to call "super dealloc"
        [super dealloc];
    }
    
-(void)backButton
{
    [[CCDirector sharedDirector] replaceScene:[SceneMark node]];
    //  
    
}


@end
