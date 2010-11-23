//
// DemoViewController.h
// Demo
//
// Created by Neil Ang on 23/11/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NACarousel.h"

@interface DemoViewController : UIViewController {
	NACarousel *carousel;
}

- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@property (nonatomic, retain) IBOutlet NACarousel *carousel;

@end

