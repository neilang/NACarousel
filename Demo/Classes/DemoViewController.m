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

- (void)viewDidLoad {
	[super viewDidLoad];

  self.carousel = [[NACarousel alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
  
	[self.carousel addImage:@"image1.png"];
	[self.carousel addImage:@"image2.png"];
	[self.carousel addImage:@"image3.png"];
  
  [self.view addSubview:self.carousel];
}

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


- (void)dealloc {
	[carousel release];
	[super dealloc];
}

@end
