//
//  UIViewController+HttpProtocol.m
//  XLURLProtocol
//
//  Created by ddSoul on 2018/7/2.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "UIViewController+HttpProtocol.h"
/** 导入头文件 */
#import <objc/runtime.h>
#import "XLHTTPProtocol.h"
#import "XLNetWorkTool.h"

@implementation UIViewController (HttpProtocol)

+ (void)load {
    
    /** 获取原始方法 */
    Method originalM = class_getInstanceMethod([self class], @selector(viewDidLoad));
    
    /** 获取自定义的方法 */
    Method exchangeM = class_getInstanceMethod([self class], @selector(my_viewDidLoad));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

/** 自定义的方法 */
- (void)my_viewDidLoad {
    [NSURLProtocol registerClass: [XLHTTPProtocol class]];
    [[XLNetWorkTool shareInstance] showUrls:@[@"http://202.106.235.45:8080",@"http://202.106.235.45:7060",@"http://202.106.235.45:7057"]];
}


@end
