//
//  DetailViewController.m
//  Friday
//
//  Created by hua on 15/6/11.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"

@interface DetailViewController ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tablView;

@property(nonatomic,strong) UITapGestureRecognizer *tapGesture ;

@property(nonatomic,strong) NSMutableArray *detailTableArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"Detail";
    
    self.tablView.delegate = self;
    self.tablView.dataSource = self;
    
    UIImage *image = [UIImage imageNamed:]
    
    self.tablView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    [self.view addSubview:_tablView];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50)];
    label.text = @"Detail";
    label.backgroundColor = [UIColor grayColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label setUserInteractionEnabled:YES];//要设置这个才能拦截到点击事件
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onLabelClick:)];
    [_tapGesture setNumberOfTapsRequired:1];
    [label addGestureRecognizer:_tapGesture];
    
    _tapGesture.delegate = self;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 380, 100, 30)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    //设置中心点
    [button setCenter:CGPointMake(self.view.frame.size.width / 2, 180)];
    
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
        imageView.frame = CGRectMake(0, 400, self.view.frame.size.width, 500);
        [self.view addSubview:imageView];
    }
    [self initDetailTableViewArray];
    
    [self.view addSubview:label];
    [self.view addSubview:button];
}

-(void)initDetailTableViewArray{
    self.detailTableArray = [NSMutableArray array];
    
    for (int i = 0; i < 9; i++) {
        NSString *title = [NSString stringWithFormat:@"title - %d",i];
        [self.detailTableArray addObject:title];
    }
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

#pragma mark UITableViewDelegate & UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.detailTableArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CellIdentity";
    
    //重用，防止内存溢出
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.titleLable.text = [_detailTableArray objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor redColor];
        
    }
    
    return cell;
    
}

-(UITableView *)tablView{
    if(!_tablView){
        _tablView = [[UITableView alloc] init];
    }
    return _tablView;
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
