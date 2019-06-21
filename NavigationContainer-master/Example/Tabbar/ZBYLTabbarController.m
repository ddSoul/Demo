//
//  ZBYLTabbarController.m
//  ZBYL
//
//  Created by ddSoul on 2018/1/15.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ZBYLTabbarController.h"
#import "TableViewController.h"
#import "ViewController.h"
#import "XPRootNavigationController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface ZBYLTabbarController ()

@end

@implementation ZBYLTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"ViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home_tabbar",
                                   kSelImgKey : @"home_tabbar_s"},
                                 
                                 @{kClassKey  : @"ViewController",
                                   kTitleKey  : @"客服",
                                   kImgKey    : @"service_tabbar",
                                   kSelImgKey : @"service_tabbar_s"},
                                 
                                 @{kClassKey  : @"ViewController",
                                   kTitleKey  : @"分类",
                                   kImgKey    : @"class_tabbar",
                                   kSelImgKey : @"class_tabbar_s"},
                                 
                                 @{kClassKey  : @"ViewController",
                                   kTitleKey  : @"购物车",
                                   kImgKey    : @"shopcar_tabbar",
                                   kSelImgKey : @"shopcar_tabbar_s"},
                                 
                                 @{kClassKey  : @"ViewController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"mine_tabbar",
                                   kSelImgKey : @"mine_tabbar_s"}
                                 //
                                 ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        XPRootNavigationController *nav = [[XPRootNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:(214)/255.0 green:(33)/255.0 blue:(25)/255.0 alpha:1.0]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    [[UITabBar appearance] setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
