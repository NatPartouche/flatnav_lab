//
//  AppDelegate.h
//  flatnav_lab
//
//  Created by Natanel Partouche on 10/04/12.
//  Copyright ECE 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
