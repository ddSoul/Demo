//
//  XLModel_BaseOrder.m
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLModel_BaseOrder.h"
#import "XLOrderHelper.h"

@implementation XLModel_BaseOrder

- (XLOrderTypeEnum)orderTypeEnum {
    NSString *enName = self.orderType;
    NSAssert(enName.length > 0, @"enName不能为空");
    return [self.orderHelper enumValueOfEnName:enName];
    return -1;
}
- (XLOrderStatusEnum)orderStatusEnum {
    return 1;
}

@end
