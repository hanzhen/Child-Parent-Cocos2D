// Created by Peter Matthews on 22/08/2012
// Copyright 2012 Peter Matthews
//
// www.shakeyourapp.net/developer
// Code Examples
// Peter Matthews -  peterm999@msn.com


//This class demonstrates the use of NSNotificationCentre

#import "SchedulerMenu.h"

@implementation SchedulerMenu

-(id) init
{
    
    if ((self = [super init])) {
        
        
        [self addBackground];
        [self addTitleText];
        [self addMenuItem];
        [self informationText];
        
        buttonsEnabled = YES;
        isExitPressed = NO;
        
    }
    
    return self;
}


-(void)addBackground {
    
    CCSprite *background = [CCSprite spriteWithFile:@"aboutmenu.png"];
    background.anchorPoint = ccp(0.5,0.5);
    background.position = ccp(0,0);
    background.opacity = 230;
    [self addChild:background z:0];
    
    
}


-(void)addTitleText {
    
    
    CCLabelBMFont *titleText;
    titleText = [CCLabelBMFont 
                 labelWithString:@"Scheduler Menu"
                 fntFile:@"menutext.fnt"]; 
    titleText.anchorPoint = ccp(0.5,0.5);
    titleText.position = ccp(0,80);
    titleText.color = ccYELLOW;
    [self addChild:titleText z:2];
    
}


-(void)addMenuItem {
    
    CCMenuItemImage *exitButton= [CCMenuItemImage itemWithNormalImage:@"smallbuttonxselected.png" selectedImage:@"smallbuttonxnormal.png" target:self selector:@selector(exitPressed)];
    CCMenu *menu2 = [CCMenu menuWithItems:exitButton,nil];
    menu2.anchorPoint = ccp(0.5,0.5);
    menu2.position = ccp (90,-90);
    [self addChild:menu2 z:2];
    
}


-(void)informationText {
    
    CCLabelBMFont *infoText = [CCLabelBMFont 
                               labelWithString:@"HelloWorldLayer constantly\ncalls the isButtonPressed \nmethod until it recieves\nYES and then closes \nthis menu..."
                               fntFile:@"informationfont.fnt"]; 
    infoText.anchorPoint = ccp(0.5,0.5);
    infoText.position = ccp(0,-15);
    infoText.scale = 0.8;
    [self addChild:infoText z:2];
    
    
    
}


-(void)exitPressed {
    
    if (buttonsEnabled) {
        
        //Dont allow pressed anymore
        buttonsEnabled = NO;
        
        //And now set isExitPressed to YES - the next time the scheduler calls
        //hasExitBeenPressed from HelloWorldLayer it will return YES
        isExitPressed = YES;
        
        
    }
}

-(BOOL)hasExitBeenPressed {
    
    return isExitPressed;
}

@end
