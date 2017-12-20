//
//  XLModel_BaseOrder.h
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLModel_BaseOrder : NSObject

@property (nonatomic, copy) NSString *creatTime;
@property (nonatomic, copy) NSString *orderNO;
@property (nonatomic, copy) NSString *orderType;
@property (nonatomic, copy) NSString *orderStatus;

@property (nonatomic, assign) XLOrderTypeEnum orderTypeEnum;
@property (nonatomic, assign) XLOrderStatusEnum orderStatusEnum;

@end
