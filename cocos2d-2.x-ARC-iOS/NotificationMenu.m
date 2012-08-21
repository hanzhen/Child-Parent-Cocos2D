//This class demonstrates the use of NSNotificationCentre

#import "NotificationMenu.h"

@implementation NotificationMenu

-(id) init
{
    
    if ((self = [super init])) {
        
        
        [self addBackground];
        [self addTitleText];
        [self addMenuItem];
        [self informationText];
        
        buttonsEnabled = YES;
        
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
                 labelWithString:@"Notification Menu"
                 fntFile:@"menutext.fnt"]; 
    titleText.anchorPoint = ccp(0.5,0.5);
    titleText.position = ccp(0,80);
    titleText.color = ccORANGE;
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
                               labelWithString:@"This posts a notification\nwhich any class\ncan listen out for\nto close the menu..."
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
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"closeNotificationMenu" object:nil];


    }
}


@end
