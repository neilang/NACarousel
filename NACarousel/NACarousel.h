//
// NACarousel.h
// Carousel
//
// Created by Neil Ang on 23/11/10.
// Copyright 2010 neilang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NACarousel : UIView {
	@private
	NSMutableArray *_images;
	NSTimer        *_carouselTimer;
}

- (void)addImage:(NSString *)imageName;

- (void)next;
- (void)prev;
- (void)start;
- (void)stop;

@property (nonatomic, retain, readonly) NSMutableArray *images;

@end
