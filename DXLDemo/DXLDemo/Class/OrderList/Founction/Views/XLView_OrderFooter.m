//
//  XLView_OrderFooter.m
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLView_OrderFooter.h"

@interface XLView_OrderFooter()
{
    UIView *_contentView;
}
@end

@implementation XLView_OrderFooter

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
//    _contentView = [[UIView alloc] init];
//    _contentView.backgroundColor = [UIColor purpleColor];
//    [self addSubview:_contentView];
//    
//    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.right.mas_equalTo(0);
//        make.height.mas_equalTo(100);
//    }];
//}

@end
