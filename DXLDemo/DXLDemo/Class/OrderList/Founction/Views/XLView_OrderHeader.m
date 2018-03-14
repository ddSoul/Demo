//
//  XLView_OrderHeader.m
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLView_OrderHeader.h"

@interface XLView_OrderHeader()
{
    UILabel *_orderType;
    UILabel *_orderStatus;
}
@end

@implementation XLView_OrderHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.frame = frame;
//        [self createControls];
    }
    return self;
}

//- (void)createControls {
//    _orderType = [[UILabel alloc] init];
//    _orderType.text = @"超级购物";
//    [self addSubview:_orderType];
//    
////    _orderStatus = [[UILabel alloc] init];
////    _orderStatus.text = @"代付款";
////    [self addSubview:_orderStatus];
//    
//    [_orderType mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.mas_equalTo(0);
//    }];
////
////    [_orderStatus mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.mas_equalTo(0);
////        make
////    }];
//}

@end
