//
//  XLView_OrderContent.m
//  OrderList
//
//  Created by ddSoul on 2017/12/20.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLView_OrderContent.h"

@interface XLView_OrderContent()
{
    UIView *_contentView;
}
@end

@implementation XLView_OrderContent

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
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor greenColor];
    [self addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
}

@end
