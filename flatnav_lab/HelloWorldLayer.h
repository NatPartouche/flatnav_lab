//
//  HelloWorldLayer.h
//  flatnav_lab
//
//  Created by Natanel Partouche on 10/04/12.
//  Copyright ECE 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *sprite;
    CCSprite *image_color;
    CCSprite *image_black_white;
    CCSprite *is_moving;
    NSMutableArray *sprites_array;
    int zOrder;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)selectSpriteForTouch:(CGPoint)position;
-(void)add_color_to_sprite:(CGPoint)position;

@end
