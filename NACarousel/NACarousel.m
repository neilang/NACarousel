//
// NACarousel.m
// Carousel
//
// Created by Neil Ang on 23/11/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import "NACarousel.h"
#import <QuartzCore/QuartzCore.h>

// Private methods
@interface NACarousel ()

- (void)transitionTo:(UIImageView *)newView;
- (UIImageView *)currentImageView;

@end

@implementation NACarousel

@synthesize images = _images;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self) {
		_images        = [[NSMutableArray alloc] initWithCapacity:2];
		_carouselTimer = nil;
	}

	return self;
}

// Add an image to the array
- (void)addImage:(NSString *)imageName {
	UIImage     *image     = [UIImage imageNamed:imageName];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

	// Hide each imageview except the first one
	imageView.hidden = [self.images count] ? YES : NO;

	[self.images addObject:imageView];
	[self addSubview:imageView];
}

#pragma mark Carousel Controls

- (void)next {
	int current = [self.images indexOfObject:[self currentImageView]];
	int next    = current + 1;

	if (next >= [self.images count]) {
		next = 0;
	}

	[self transitionTo:[self.images objectAtIndex:next]];
}

- (void)prev {
	int current = [self.images indexOfObject:[self currentImageView]];
	int prev    = current - 1;

	if (prev < 0) {
		prev = [self.images count] - 1;
	}

	[self transitionTo:[self.images objectAtIndex:prev]];
}

- (void)start {
	if (_carouselTimer == nil) {
		_carouselTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(next) userInfo:nil repeats:YES];
	}
}

- (void)stop {
	[_carouselTimer invalidate];
	_carouselTimer = nil;
}

#pragma mark Private methods

- (UIImageView *)currentImageView {
	for (UIImageView *imageView in self.images) {
		if (imageView.hidden == NO) {
			return imageView;
		}
	}

	return nil;
}

- (void)transitionTo:(UIImageView *)newView {
	// Can the transition be a property?

	CATransition *transition = [CATransition animation];

	transition.duration       = 0.75f;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type           = kCATransitionFade;

	[self.layer addAnimation:transition forKey:nil];

	[self currentImageView].hidden = YES;
	newView.hidden                 = NO;
}

- (void)dealloc {
	[_carouselTimer invalidate];
	[_images release];
	[super dealloc];
}

@end
