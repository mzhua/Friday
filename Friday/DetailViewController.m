//
//  DetailViewController.m
//  Friday
//
//  Created by hua on 15/6/11.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UITapGestureRecognizer *tapGesture ;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"Detail";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    label.text = @"Detail";
    label.backgroundColor = [UIColor grayColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label setUserInteractionEnabled:YES];//要设置这个才能拦截到点击事件
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onLabelClick:)];
    [_tapGesture setNumberOfTapsRequired:1];
    [label addGestureRecognizer:_tapGesture];
    
    _tapGesture.delegate = self;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 180, 100, 30)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    //设置中心点
    [button setCenter:CGPointMake(self.view.frame.size.width / 2, 180)];
    
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
        imageView.frame = CGRectMake(0, 200, self.view.frame.size.width, 500);
        [self.view addSubview:imageView];
    }
    
    
    [self.view addSubview:label];
    [self.view addSubview:button];
}

-(void)onButtonClick{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"点击按钮" message:@"你点击了按钮" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
}

-(void)onLabelClick: (UITapGestureRecognizer *)recognizer{
    NSLog(@"click");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"test" message:@"test message" delegate:nil cancelButtonTitle:@"Cancle" otherButtonTitles:@"Ok", nil];
    
    [alertView show];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
