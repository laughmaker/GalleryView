//
//  ViewController.m
//  GalleryViewDemo
//
//  Created by line0 on 13-5-27.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <GalleryViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *images = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 4; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    [self.gallerView setImages:images];
}

#pragma mark - GalleryView Delegate

- (void)galleryView:(GalleryView *)galleryView didShowPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"pageIndexDidShow:%d", pageIndex);
}

- (void)galleryView:(GalleryView *)galleryView didSelectPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"pageIndexDidSelected:%d", pageIndex);
}

@end
