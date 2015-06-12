//
//  ViewController.m
//  Friday
//
//  Created by hua on 15/6/11.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ImageSliderView.h"

@interface ViewController ()<ImageSliderDelegate>

@property (nonatomic,strong) ImageSliderView *imageSliderView;

@property (nonatomic,strong) NSMutableArray *imageArray;

@property (nonatomic,weak) ViewController *weakSelf;//本次没有请求，如果有网络请求的话要使用弱引用

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _weakSelf = self;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Friday";
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"view controller width = %f",self.view.frame.size.width);
    
    //self.imageSliderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 3);
    
    [self.view addSubview:self.imageSliderView];
    
    [self setUpImageSliderData];
    
}

/**
 *  初始化数据
 */
-(void)setUpImageSliderData{
    self.imageArray = [NSMutableArray array];
    
    UIImage *guide1 = [UIImage imageNamed:@"guide_1"];
    UIImage *guide2 = [UIImage imageNamed:@"guide_2"];
    
    [self.imageArray addObject:guide1];
    [self.imageArray addObject:guide2];
    
    [self.imageSliderView initWithImageUrls:_weakSelf.imageArray placeHolder:nil delegate:self];
}

/**
 *  ImageSliderView点击事件回调
 *
 *  @param imageSliderView <#imageSliderView description#>
 *  @param index           <#index description#>
 *  @param imageUrl        <#imageUrl description#>
 */
-(void)imageSliderView:(ImageSliderView *)imageSliderView didTapAtIndex:(NSInteger)index image:(UIImage *)image{
    NSLog(@"index = %ld",(long)index);
    
    DetailViewController *detailController = [[DetailViewController alloc] init];
    detailController.title = [NSString stringWithFormat:@"Image-%ld",(long)index];
    detailController.image = image;
    
    [self.navigationController pushViewController:detailController animated:YES];

}

#pragma mark - getter & setter
/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */

-(ImageSliderView *)imageSliderView{
    
    if(!_imageSliderView){//防止循环引用
        _imageSliderView = [[ImageSliderView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height )];
        
    }
    
    return _imageSliderView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
