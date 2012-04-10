//
//  HelloWorldLayer.m
//  flatnav_lab
//
//  Created by Natanel Partouche on 10/04/12.
//  Copyright ECE 2012. All rights reserved.
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
        
        CGSize size = [[CCDirector sharedDirector] winSize];
       
        image_black_white=[CCSprite spriteWithFile:@"dessin_Black_white.png"];
        image_black_white.position=ccp(150,210);
        [self addChild:image_black_white];        
        
        image_color=[CCSprite spriteWithFile:@"dessin_Color.png"];
        image_color.position=ccp(150,210);
        [self addChild:image_color];
        
        
        
        sprites_array=[[NSMutableArray alloc]init ];
        sprite=[CCSprite spriteWithFile:@"Icon.png"];
        
        
        CCSprite *color1=[CCSprite spriteWithFile:@"Icon.png"];
        color1.color=ccc3(52, 131, 249);
        color1.position=ccp(440,0);

        
        CCSprite *color2=[CCSprite spriteWithFile:@"Icon.png"];
        color2.color=ccc3(249,52, 52);
        color2.position=ccp(440,50);

        
        CCSprite *color3=[CCSprite spriteWithFile:@"Icon.png"];
        color3.color=ccc3(249, 242, 52);
        color3.position=ccp(440,100);

        
        [sprites_array addObject:color1];
        [sprites_array addObject:color2];
        [sprites_array addObject:color3];
        
        self.isTouchEnabled=YES;
		
       
        for (int i=0; i<[sprites_array count]; i++) {
            [self addChild:[sprites_array objectAtIndex:i]];
        }
    
    }
	return self;
}

-(void)getpixel:(CGPoint)location
{
    Byte pixelColor[4];
    location = [[CCDirector sharedDirector] convertToGL:location];
    glReadPixels(location.x,location.y, 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, &pixelColor[0]);
    NSLog(@"%d %d %d",pixelColor[0],pixelColor[1],pixelColor[2]);
    if ((pixelColor[0]==52) && (pixelColor[1]==131) && (pixelColor[2]==249))
    {
        NSLog(@"Bleu");
    }
    if ((pixelColor[0]==249) && (pixelColor[1]==52) && (pixelColor[2]==52))
    {
        NSLog(@"rouge");
    }
    if ((pixelColor[0]==249) && (pixelColor[1]==242) && (pixelColor[2]==52))
    {
        NSLog(@"Jaune");
    }
}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"begin");
    UITouch *touch = [touches anyObject];

    CGPoint location = [touch locationInView: [touch view]];
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];

    [self getpixel:location];
    [self selectSpriteForTouch:touchLocation];
    
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    

    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if (is_moving)
    {
        is_moving.position=location;   
    
    }
    else
    {
        NSLog(@"no sprive selected");
    }
}
- (void)selectSpriteForTouch:(CGPoint)touchLocation {
    is_moving=nil;
    for (int i=0;i<[sprites_array count];i++) {
        CCSprite *tempo=[sprites_array objectAtIndex:i];

        if (CGRectContainsPoint(tempo.boundingBox, touchLocation)) {            
            is_moving= [sprites_array objectAtIndex:i];
            NSLog(@"i : %d",i);
            break;
        }
    }

}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
   
    is_moving=nil;
    
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
