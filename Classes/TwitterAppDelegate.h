//
//  TwitterAppDelegate.h
//  Twitter
//
//  Created by masbog on 2/10/11.
//  Copyright masbog inc. 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
