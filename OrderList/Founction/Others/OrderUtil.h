//
//  OrderUtil.h
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#ifndef OrderUtil_h
#define OrderUtil_h

typedef NS_ENUM(NSInteger,XLOrderStatusEnum){
    XLOrderStatusUnSubmit = 1,             //未提交
    XLOrderStatusSubmited,
    XLOrderStatusUnPay,
    XLOrderStatusPayed
};

typedef NS_ENUM(NSInteger,XLOrderTypeEnum){
    XLOrderTypeOfBusses1 = 1,             //未提交
    XLOrderTypeOfBusses2,
    XLOrderTypeOfBusses3
};




#endif /* OrderUtil_h */
