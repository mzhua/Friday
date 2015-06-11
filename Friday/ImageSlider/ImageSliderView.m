//
//  ImageSliderView.m
//  Friday
//
//  Created by hua on 15/6/11.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "ImageSliderView.h"

@interface ImageSliderView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSArray *images;

@end

@implementation ImageSliderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

-(void)_init{
     NSLog(@"s width = %f",self.frame.size.width);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.scrollView];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.pagingEnabled = YES;//按一页一页滚动
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled = YES;
    
    self.scrollView.delegate = self;
    
}
-(void)initWithImageUrls:(NSArray *)imageUrls placeHolder:(UIImage *)placeHolder delegate:(id<ImageSliderDelegate>)delegate{
    [self initWithImageURLs:imageUrls placeholder:placeHolder delegate:delegate edgeInsets:UIEdgeInsetsZero];
    
    
}
- (void)initWithImageURLs:(NSArray *)images placeholder:(UIImage *)placeholder delegate:(id<ImageSliderDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets
{
    self.images = images;
    self.imageSliderDelegate = delegate;
    
    if (images.count <= 0) {
        return;
    }
    
    CGFloat startX = self.scrollView.bounds.origin.x;
    CGFloat width = self.bounds.size.width - edgeInsets.left - edgeInsets.right;
    CGFloat height = self.bounds.size.height - edgeInsets.top - edgeInsets.bottom;
    
    for (int i = 0; i < images.count; i++) {
        startX = i * width;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(startX, 0, width, height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;//等比缩放，完全显示
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)]];
        
        UIImage *image = [images objectAtIndex:i];
        
        [imageView setImage:image];
        
        [self.scrollView addSubview:imageView];
    }
    NSLog(@"scroll width = %f",self.scrollView.frame.size.width);
    
    //重要，一定要手动设置scrollview的contentsize
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * images.count, self.scrollView.frame.size.height);
}

-(void)handleTapGesture:(UIGestureRecognizer *)tapGesture{

    UIImageView *imageView = (UIImageView *)tapGesture.view;
    
    NSInteger index = imageView.tag;

    if (self.imageSliderDelegate && [self.imageSliderDelegate respondsToSelector:@selector(imageSliderView:didTapAtIndex:image:)]) {
        [self.imageSliderDelegate imageSliderView:self didTapAtIndex:index image:[self.images objectAtIndex:index]];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
