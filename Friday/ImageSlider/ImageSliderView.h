//
//  ImageSliderView.h
//  Friday
//
//  Created by hua on 15/6/11.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageSliderDelegate;

@interface ImageSliderView : UIView

@property (nonatomic, assign) id<ImageSliderDelegate> imageSliderDelegate;

/**
 *  init image slider view
 *
 *  @param imageUrls   imageUrls
 *  @param placeHolder placeHolder
 *  @param delegate    delegate
 */
-(void)initWithImageUrls:(NSArray *)images placeHolder:(UIImage *)placeHolder delegate:(id<ImageSliderDelegate>)delegate;
@end

/**
 *  Tap view action
 */
@protocol ImageSliderDelegate<NSObject>

@optional
-(void)imageSliderView:(ImageSliderView *)imageSliderView didTapAtIndex:(NSInteger)index image:(UIImage *)image;

@end