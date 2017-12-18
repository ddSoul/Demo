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
        [self createControls];
    }
    return self;
}

- (void)createControls {
    
}

@end
