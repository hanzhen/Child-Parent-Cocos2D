//
//  HelloWorldLayer.m
//  cocos2d-2.x-ARC-iOS
//
//  Created by Steffen Itterheim on 27.04.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//



#import "HelloWorldLayer.h"

#import "AppDelegate.h"

//Import the different menus
#import "DelegateMenu.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{

	CCScene *scene = [CCScene node];

	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
		
	 
		[self createTitle];
		
        [self createMenu];
        
        [self listenForNotification];
        
        buttonsEnabled = YES;

	}
    
	return self;
}

-(void)createTitle {
    
    // using \n in a string puts the text on a new line

    CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"Child Talking to\n Parent Class\n    Examples" fntFile:@"titlefont.fnt"];
    
    //centre align label
    label.anchorPoint = ccp(0.5,0.5);
    
    CGSize size = [[CCDirector sharedDirector] winSize];	
    label.position =  ccp( size.width /2 , size.height/2+50);
    label.rotation = 350;
    label.scale = 0.0;
    [self addChild: label];
    
    
    //Create a nice animation - note we set scale to 0.0 above
    id scaleIn = [CCScaleTo actionWithDuration:1.5 scale:0.8];
    id bounce = [CCEaseElasticOut actionWithAction:scaleIn];
    [label runAction:bounce];
    
    
}


-(void)createMenu {
    
    //Selector menu item
    CCLabelBMFont *notificationLabel = [CCLabelBMFont labelWithString:@"Notification" fntFile:@"menutext.fnt"];
    CCMenuItemLabel *notificationMenuItem = [CCMenuItemLabel itemWithLabel:notificationLabel target:self selector:@selector(openNotificationMenu)];
    
    
    //Delegate menu item
    CCLabelBMFont *delegateLabel = [CCLabelBMFont labelWithString:@"Delegate" fntFile:@"menutext.fnt"];
    CCMenuItemLabel *delegateMenuItem = [CCMenuItemLabel itemWithLabel:delegateLabel target:self selector:@selector(openDelegateMenu)];
    
    
    //Scheduler menu item
    CCLabelBMFont *scheduleLabel = [CCLabelBMFont labelWithString:@"Scheduler" fntFile:@"menutext.fnt"];
    CCMenuItemLabel *scheduleMenuItem = [CCMenuItemLabel itemWithLabel:scheduleLabel target:self selector:@selector(openSchedulerMenu)];
    
    
    
    //Now add all the items to the menu
    CCMenu *menu = [CCMenu menuWithItems:notificationMenuItem,delegateMenuItem,scheduleMenuItem, nil];
    
    //Get the current screen size
    CGSize size = [[CCDirector sharedDirector] winSize];	
    
    //Use the screen size info to set the position of the menu
    [menu setPosition:ccp( size.width/2, size.height/2 - 85)];
    
    //sets the space between items in the menu
    [menu alignItemsHorizontallyWithPadding:50];
    
    //And then add the menu as a child to this current scene
    [self addChild:menu];
    
}




#pragma mark-
#pragma mark Notification Menu Code
-(void)listenForNotification {
    
    //We need to tell this node to listen out for the notification string @"closeNotificationMenu"
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeNotificationMenuRecieved) name:@"closeNotificationMenu" object:nil];
    
                                                                              
                                                                              
}

-(void)stopListeningForNotification {

    //We would need to call this if the scene changes as it could
    //cause a memory leak and would stop the scene ever being released properly
    //as we are using ARC we would call it from -(void)cleanup
    
    [[NSNotificationCenter defaultCenter] removeObserver:@"closeNotificationMenu"];

}




-(void)openNotificationMenu {
    
    if (buttonsEnabled) {
        //Dont allow any more buttons in this scene
        buttonsEnabled = NO; 
        
        //We create the node
        //If we hadnt created a weak reference we would use:
        //NotificationMenu *newNotificationMenu = [NotificationMenu node];
        
        newNotificationMenu = [NotificationMenu node];
        
             
        CGSize size = [[CCDirector sharedDirector] winSize];	
        newNotificationMenu.position =  ccp( size.width /2 , size.height/2 - 300);
        
        
        //After this we add the child to the current node
        
        
        [self addChild:newNotificationMenu];
        
        //Now animate it in - we hid it by putting a -300 in the Y CoOrdinate
        
        id moveUp = [CCMoveTo actionWithDuration:1.5 position:ccp( size.width /2 , size.height/2)];
        id bounce = [CCEaseElasticOut actionWithAction:moveUp];
        [newNotificationMenu runAction:bounce];
        
    }
}



-(void)closeNotificationMenuRecieved {
    
    
    //We want to animate the menu out and then remove it only after the
    //animation has finished
    
    CGSize size = [[CCDirector sharedDirector] winSize];	
    
    id moveOut = [CCMoveTo actionWithDuration:0.5 position:ccp( size.width /2 , size.height/2 - 300)];
    id bounce = [CCEaseExponentialIn actionWithAction:moveOut];
    
    //This is how you call a method inside a Cocos Animation block
    id runMethod = [CCCallFunc actionWithTarget:self selector:@selector(removeNotificationNode)];
    
    //Then we crate the sequence - first bounce out and then run the method
    id actionSequence = [CCSequence actions:bounce,runMethod, nil];
    
    [newNotificationMenu runAction:actionSequence];
    
    
}

-(void)removeNotificationNode {
    
    //We remove the child - but we dont stop listening for the notification
    //as we will need it next time
    [self removeChild:newNotificationMenu cleanup:YES];
    
    buttonsEnabled = YES;
}


#pragma mark-
#pragma mark Delegate Menu Code

-(void)openDelegateMenu {
    
    if (buttonsEnabled) {
        
        //Dont allow any more buttons in this scene
        buttonsEnabled = NO;
        
        
        //We create the node
        //If we hadnt created a weak reference we would use:
        //DelegateMenu *newDelegateMenu = [DelegateMenu node];
        
        newDelegateMenu = [DelegateMenu node];
        
        //and must remember to set the delegate to self for any of the delegate code
        //to be called here
        [newDelegateMenu setDelegate :self];
        
        CGSize size = [[CCDirector sharedDirector] winSize];	
        newDelegateMenu.position =  ccp( size.width /2 , size.height/2 - 300);
        
        
        //After this we add the child to the current node
        
        
        [self addChild:newDelegateMenu];
        
        //Now animate it in - we hid it by putting a -300 in the Y CoOrdinate
        
        id moveUp = [CCMoveTo actionWithDuration:1.5 position:ccp( size.width /2 , size.height/2)];
        id bounce = [CCEaseElasticOut actionWithAction:moveUp];
        [newDelegateMenu runAction:bounce];
        
    }    
}


//This method doesnt need setting in HelloWorldLayer.h as our class
//is aware of it due to the delegate being set in HellowWorldLayer.h
-(void)exitPressedInDelegateMenu {

    //We want to animate the menu out and then remove it only after the
    //animation has finished
    
    CGSize size = [[CCDirector sharedDirector] winSize];	
     
    id moveOut = [CCMoveTo actionWithDuration:0.5 position:ccp( size.width /2 , size.height/2 - 300)];
    id bounce = [CCEaseExponentialIn actionWithAction:moveOut];
    
    //This is how you call a method inside a Cocos Animation block
    id runMethod = [CCCallFunc actionWithTarget:self selector:@selector(removeDelegateNode)];
    
    //Then we crate the sequence - first bounce out and then run the method
    id actionSequence = [CCSequence actions:bounce,runMethod, nil];
    
    [newDelegateMenu runAction:actionSequence];
    

    
} 


-(void)removeDelegateNode {
    
    
    //Its important to cancel the delegate now
    [newDelegateMenu setDelegate:nil];
    
    //And then remove the node
    [self removeChild:newDelegateMenu cleanup:YES];
    
    //Allow button presses again
    buttonsEnabled = YES;
    
}


#pragma mark-
#pragma mark Scheduler Code



-(void)openSchedulerMenu {
    
    if (buttonsEnabled) {
        //Dont allow any more buttons in this scene
        buttonsEnabled = NO; 
        
        
        newSchedulerMenu = [SchedulerMenu node];
        
        
        CGSize size = [[CCDirector sharedDirector] winSize];	
        newSchedulerMenu.position =  ccp( size.width /2 , size.height/2 - 300);
        
        
        //After this we add the child to the current node
        
        
        [self addChild:newSchedulerMenu];
        
        //Now animate it in - we hid it by putting a -300 in the Y CoOrdinate
        
        id moveUp = [CCMoveTo actionWithDuration:1.5 position:ccp( size.width /2 , size.height/2)];
        id bounce = [CCEaseElasticOut actionWithAction:moveUp];
        [newSchedulerMenu runAction:bounce];
        
    }
    
    //Now start checking if exit has been pressed
    [self startScheduler];
}





-(void)startScheduler {
    
    //This will call the method checkIfExitPressed every 0.1 seconds
[self schedule: @selector(checkIfExitPressed) interval:0.1];
    
    
    
}

-(void)checkIfExitPressed {
    
    //We call the hasExitBeenPressed method in the SchedulerMenuClass
   BOOL answer =  [newSchedulerMenu hasExitBeenPressed];
    
    if (answer == YES) {
        
        [self stopScheduler];
        [self closeSchedulerMenuRecieved];
    }
}


-(void)stopScheduler {
    
    //It is important to remember to unschedule your selectors when they are no longer needed
    [self unschedule:@selector(checkIfExitPressed)];
    
}

-(void)closeSchedulerMenuRecieved {
    
    
    //We want to animate the menu out and then remove it only after the
    //animation has finished
    
    CGSize size = [[CCDirector sharedDirector] winSize];	
    
    id moveOut = [CCMoveTo actionWithDuration:0.5 position:ccp( size.width /2 , size.height/2 - 300)];
    id bounce = [CCEaseExponentialIn actionWithAction:moveOut];
    
    //This is how you call a method inside a Cocos Animation block
    id runMethod = [CCCallFunc actionWithTarget:self selector:@selector(removeSchedulerNode)];
    
    //Then we crate the sequence - first bounce out and then run the method
    id actionSequence = [CCSequence actions:bounce,runMethod, nil];
    
    [newSchedulerMenu runAction:actionSequence];
    
    
}

-(void)removeSchedulerNode {
    
    //We remove the child - but we dont stop listening for the notification
    //as we will need it next time
    [self removeChild:newSchedulerMenu cleanup:YES];
    
    buttonsEnabled = YES;
}


#pragma mark-
#pragma mark Cleanup Tasks

-(void)cleanup {
    
    [self stopListeningForNotification];
}
@end
