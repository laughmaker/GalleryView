//  GalleryViewDemo
//
//  Created by line0 on 13-5-27.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, assign) NSInteger     index;

@property (nonatomic, strong, readonly) UITapGestureRecognizer *doubleTapGesture;


@end
