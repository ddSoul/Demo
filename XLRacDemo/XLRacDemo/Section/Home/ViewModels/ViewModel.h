//
//  ViewModel.h
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movice;

typedef void (^LoadRequestResult)(NSArray <Movice *>*viewModels);

@interface ViewModel : NSObject

@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *sAvatar;
@property (nonatomic, copy) NSString *cellType;
@property (nonatomic, copy) NSString *cellReuseIdentifier;


/**
 * command处理实际事务  网络请求
 */
@property (nonatomic, strong, readonly) RACCommand *command;

@end
