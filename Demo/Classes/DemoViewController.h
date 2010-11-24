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
    
    UIButton *nextButton;
    UIButton *prevButton;
    UIButton *startButton;
    UIButton *stopButton;
    
}

- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@property (nonatomic, retain) IBOutlet NACarousel *carousel;

@property (nonatomic, retain) IBOutlet UIButton *nextButton;
@property (nonatomic, retain) IBOutlet UIButton *prevButton;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;


@end

