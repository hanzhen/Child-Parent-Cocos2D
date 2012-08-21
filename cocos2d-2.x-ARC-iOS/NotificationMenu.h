

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface NotificationMenu : CCLayer {
    
      
    //We also need to have a buttons enabled code here
    //as users sometimes double click
    
    BOOL buttonsEnabled;
}


-(void)addBackground;
-(void)addTitleText;
-(void)addMenuItem;
-(void)informationText;
-(void)exitPressed;


@end
