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
- (instancetype)init {
    self = [super init];
    if (self) {
        //这个属性可以使present出来的控制器view设置有一定透明度的颜色
        self.modalPresentationStyle = [UIDevice currentDevice].systemVersion.floatValue >= 8 ? UIModalPresentationOverCurrentContext : UIModalPresentationCurrentContext;
    }
    return self;
}


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
    
    self.view.backgroundColor = 
    [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
/** 处理浮点数失真的类*/
//    NSDecimalNumber *price;
//
//    CGFloat fl = 1.9999955555;
//    price = [NSDecimalNumber decimalNumberWithMantissa:fl
//                                              exponent:-3
//                                            isNegative:NO];
//
//
//    NSLog(@"____________%@",price);
//    // 或者直接由字符串生成NSDecimalNumber
//    price = [NSDecimalNumber decimalNumberWithString:@"15.99"];
//    NSLog(@"___________w_%@",price);
//
//    NSDecimalNumber *jiafa = [price decimalNumberByAdding:price];
//    NSDecimalNumber*jianfa = [price decimalNumberBySubtracting:price];
//    NSDecimalNumber*chengfa = [price decimalNumberByMultiplyingBy:price];
//    NSDecimalNumber*chufa = [price decimalNumberByDividingBy:price];
    
//    LSTCouponView *alertview = [[LSTCouponView alloc] initWithFrame:CGRectMake(0, 0, XL_ScreenW, XL_ScreenH) withCoupons:nil];
//    [alertview show];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
