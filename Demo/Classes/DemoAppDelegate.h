//
//  DemoAppDelegate.h
//  Demo
//
//  Created by Neil Ang on 23/11/10.
//  Copyright 2010 neilang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface DemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DemoViewController *viewController;

@end

