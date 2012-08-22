//
//  AppDelegate.h
//

// Created by Peter Matthews on 22/08/2012
// Copyright 2012 Peter Matthews
//
// www.shakeyourapp.net/developer
// Code Examples
// Peter Matthews -  peterm999@msn.com



#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*__unsafe_unretained director_;							// weak ref
}

@property (nonatomic) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (unsafe_unretained, readonly) CCDirectorIOS *director;

@end
