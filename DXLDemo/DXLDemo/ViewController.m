//
//  ViewController.m
//  DXLDemo
//
//  Created by ddSoul on 2018/3/14.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "LSTCouponView.h"

#define XL_ScreenW [UIScreen mainScreen].bounds.size.width
#define XL_ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(20, 200, 50, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnClick{
    

    LSTCouponView *alertview = [[LSTCouponView alloc] initWithFrame:CGRectMake(0, 0, XL_ScreenW, XL_ScreenH) withCoupons:nil];
    [alertview show];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
