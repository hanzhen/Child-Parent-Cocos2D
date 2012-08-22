//
//  HelloWorldLayer.h
//

// Created by Peter Matthews on 22/08/2012
// Copyright 2012 Peter Matthews
//
// www.shakeyourapp.net/developer
// Code Examples
// Peter Matthews -  peterm999@msn.com




#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

//Import the menus here
#import "DelegateMenu.h"
#import "NotificationMenu.h"
#import "SchedulerMenu.h"
//Then make the interface aware of the delegate
@interface HelloWorldLayer : CCLayer <DelegateMenuDelegate>
{
    
    //We use this to keep a weak reference to the menu
    DelegateMenu *newDelegateMenu;
    NotificationMenu *newNotificationMenu;
    SchedulerMenu *newSchedulerMenu;
    
    //We need this to disable buttons when animations or menus are showing
    //This stops the same methods being called twice etc
    BOOL buttonsEnabled;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(void)createMenu;
-(void)createTitle;



-(void)openDelegateMenu;
-(void)removeDelegateNode;


-(void)openNotificationMenu;
-(void)closeNotificationMenuRecieved;
-(void)listenForNotification;
-(void)stopListeningForNotification;
-(void)removeNotificationNode;


-(void)openSchedulerMenu;
-(void)startScheduler;
-(void)checkIfExitPressed;
-(void)stopScheduler;
-(void)closeSchedulerMenuRecieved;
-(void)removeSchedulerNode;

@end
