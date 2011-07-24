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

@property (nonatomic, assign, readwrite) BOOL isTransitioning;
@property (nonatomic, assign, readwrite) BOOL isStarted;

@end

@implementation NACarousel

@synthesize images             = _images;
@synthesize isTransitioning    = _isTransitioning;
@synthesize isStarted          = _isStarted;
@synthesize transitionDuration = _transitionDuration;
@synthesize slideDuration      = _slideDuration;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self) {
		_images             = [[NSMutableArray alloc] initWithCapacity:2];
		_carouselTimer      = nil;
		_isTransitioning    = NO;
		_isStarted          = NO;
		_transitionDuration = 0.75f;
		_slideDuration      = 2.0f;
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
  
#if !__has_feature(objc_arc)
  [imageView release];
#endif
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	self.isTransitioning = NO;
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
		_carouselTimer = [NSTimer scheduledTimerWithTimeInterval:self.slideDuration target:self selector:@selector(next) userInfo:nil repeats:YES];
		self.isStarted = YES;
	}
}

- (void)stop {
	[_carouselTimer invalidate];
	self.isStarted = NO;
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
	// Don't transition if already in a transition
	if (self.isTransitioning) {
		return;
	}

	self.isTransitioning = YES;

	CATransition *transition = [CATransition animation];

	// Should these be properties? Most likely yes.
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type           = kCATransitionFade;

	transition.duration = self.transitionDuration;
	transition.delegate = self;

	[self.layer addAnimation:transition forKey:nil];

	[self currentImageView].hidden = YES;
	newView.hidden                 = NO;
}

#if !__has_feature(objc_arc)
- (void)dealloc {
	[_carouselTimer invalidate];
	[_images release];
	[super dealloc];
}
#endif

@end
