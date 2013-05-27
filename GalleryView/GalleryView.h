//  GalleryViewDemo
//
//  Created by line0 on 13-5-27.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomScrollView.h"

@protocol GalleryViewDelegate;

@interface GalleryView : UIView <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet id <GalleryViewDelegate>    delegate;

@property (nonatomic, strong, readonly) UIScrollView    *scrollView;
@property (assign, nonatomic, readonly) NSInteger       currentPage;

@property (assign, nonatomic) CGFloat maximumZoomScale;//默认为1
@property (assign, nonatomic) CGFloat minimumZoomScale;//默认为3

@property (strong, nonatomic) NSArray *images;


@end



@protocol GalleryViewDelegate <NSObject>

@optional

//滑动时，切换到某一页时调用
- (void)galleryView:(GalleryView *)galleryView didShowPageAtIndex:(NSInteger)pageIndex;

//点击某一页时调用
- (void)galleryView:(GalleryView *)galleryView didSelectPageAtIndex:(NSInteger)pageIndex;

@end
