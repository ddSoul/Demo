//
//  XLViewModel_Order.m
//  OrderList
//
//  Created by ddSoul on 2017/12/20.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLViewModel_Order.h"
#import "XLModel_BaseOrder.h"

@interface XLViewModel_Order()

@end

@implementation XLViewModel_Order

- (instancetype)initWithOrder:(XLModel_BaseOrder *)order {
    self = [super init];
    if (!self) return nil;
    if (!order) return nil;
    
    switch (order.orderTypeEnum) {
        case XLOrderTypeOfBusses1: {
            return self;
        }
        case XLOrderTypeOfBusses2: {
            return self;
        }
        default:
            break;
    }
    
    return self;
}

@end
