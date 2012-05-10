//
//  HelloWorldLayer.m
//  Beat Flick Beta 0.1
//
//  Created by KMO on 10/05/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Young Gunz" fontName:@"Marker Felt" fontSize:64];
        // create and initialize a Label
		CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"and his buddy Mark" fontName:@"Marker Felt" fontSize:18];


		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
        // position the label on the center of the screen
		label2.position =  ccp( size.width /2 , size.height/3 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        // add the second label as a child to this Layer
		[self addChild: label2];

	}
	return self;
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
