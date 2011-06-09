//
// DemoViewController.m
// Demo
//
// Created by Neil Ang on 23/11/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import "DemoViewController.h"

@implementation DemoViewController

@synthesize carousel;
@synthesize nextButton, prevButton, startButton, stopButton;

- (void)viewDidLoad {
	[super viewDidLoad];

  NACarousel * nacarousel = [[NACarousel alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
	self.carousel = nacarousel;
  [nacarousel release];

	[self.carousel addImage:@"image1.png"];
	[self.carousel addImage:@"image2.png"];
	[self.carousel addImage:@"image3.png"];

	[self.view addSubview:self.carousel];

	[self.carousel addObserver:self forKeyPath:@"isTransitioning" options:NSKeyValueObservingOptionNew context:NULL];
	[self.carousel addObserver:self forKeyPath:@"isStarted" options:NSKeyValueObservingOptionNew context:NULL];

    self.startButton.enabled = !self.carousel.isStarted;
    self.stopButton.enabled  = self.carousel.isStarted;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([keyPath isEqual:@"isTransitioning"]) {
		self.prevButton.enabled = !self.carousel.isTransitioning;
		self.nextButton.enabled = !self.carousel.isTransitioning;
	} else if ([keyPath isEqual:@"isStarted"]) {
		self.startButton.enabled = !self.carousel.isStarted;
		self.stopButton.enabled  = self.carousel.isStarted;
	}
}

#pragma mark IBActions

- (IBAction)next:(id)sender {
	[self.carousel next];
}

- (IBAction)prev:(id)sender {
	[self.carousel prev];
}

- (IBAction)start:(id)sender {
	[self.carousel start];
}

- (IBAction)stop:(id)sender {
	[self.carousel stop];
}

#pragma mark Memory Management

- (void)dealloc {
	[self.carousel removeObserver:self forKeyPath:@"isTransitioning"];
	[self.carousel removeObserver:self forKeyPath:@"isStarted"];

	[carousel release];
	[super dealloc];
}

@end
