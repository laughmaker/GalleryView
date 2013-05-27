//  GalleryViewDemo
//
//  Created by line0 on 13-5-27.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "ZoomScrollView.h"

@interface ZoomScrollView ()
@property (nonatomic, strong) UITapGestureRecognizer *doubleTapGesture;

@end

@implementation ZoomScrollView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delegate = self;
        [self setMinimumZoomScale:1];
        [self setMaximumZoomScale:3];
        [self setZoomScale:1];

        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.userInteractionEnabled = YES;
        [self addSubview:self.imageView];
        
        self.doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handleDoubleTap:)];
        [self.doubleTapGesture setNumberOfTapsRequired:2];
        [self.imageView addGestureRecognizer:self.doubleTapGesture];
    }
    return self;
}


#pragma mark - Zoom methods

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture
{
    float newScale = self.zoomScale * 1.5;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];
    [self zoomToRect:zoomRect animated:YES];
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    [scrollView setZoomScale:scale animated:NO];
}


@end
