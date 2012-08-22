// Created by Peter Matthews on 22/08/2012
// Copyright 2012 Peter Matthews
//
// www.shakeyourapp.net/developer
// Code Examples
// Peter Matthews -  peterm999@msn.com


#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface SchedulerMenu : CCLayer {
    
    
    //We also need to have a buttons enabled code here
    //as users sometimes double click
    
    BOOL buttonsEnabled;
    
    BOOL isExitPressed;
}


-(void)addBackground;
-(void)addTitleText;
-(void)addMenuItem;
-(void)informationText;

-(void)exitPressed;
-(BOOL)hasExitBeenPressed;

@end
