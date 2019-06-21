//
//  NextViewController.m
//  Example
//
//  Created by ddSoul on 2019/6/14.
//  Copyright © 2019 xiaopin. All rights reserved.
//

#import "NextViewController.h"
#import "UIImage+Tool.h"
#import "XPRootNavigationController.h"

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


@interface NextViewController ()

@property (strong, nonatomic) UIButton *backButton;

@end

@implementation NextViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.xp_rootNavigationController.backIconImage = [UIImage imageNamed:@"class_tabbar_s"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"next";
    

    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                      NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];

    
    UIImage *backgroundImage = [UIImage imageWithColor:UIColor.blackColor];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    
    //创建一个UIButton
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    //设置UIButton的图像
    [backButton setImage:[UIImage imageNamed:@"class_tabbar_s"] forState:UIControlStateNormal];
    //[_backButton setTitle:backStr forState:UIControlStateNormal];
    //给UIButton绑定一个方法，在这个方法中进行popViewControllerAnimated
    [backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    //然后通过系统给的自定义BarButtonItem的方法创建BarButtonItem
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    //覆盖返回按键
    self.navigationItem.leftBarButtonItem = backItem;
    
//    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"class_tabbar_s"];
    
//    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"class_tabbar_s"];
    
//    self.navigationController.backIconImage = [UIImage imageNamed:@"class_tabbar_s"];
    // Do any additional setup after loading the view.
}


- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 88, 44);
        [_backButton setImage:[UIImage imageNamed:@"App_back"] forState:UIControlStateNormal];//返回箭头图标和系统的不一致
        //[_backButton setTitle:backStr forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
        
        if (!SYSTEM_VERSION_LESS_THAN(@"11")) {
            _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [_backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5 * 375 /375.0,0,0)];
        }
        
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    return _backButton;
}

//- (void)setBackButton {
//
//    [self.backButton setTitle:@"ss" forState:UIControlStateNormal];
//}


- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
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
