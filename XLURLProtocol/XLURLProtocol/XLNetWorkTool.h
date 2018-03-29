//
//  XLNetWorkTool.h
//  XLURLProtocol
//
//  Created by ddSoul on 2018/3/28.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLNetWorkTool : NSObject

+ (instancetype)shareInstance;
- (void)showUrls:(NSArray *)urls;

@end
