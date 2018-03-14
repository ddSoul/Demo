//
//  XLCell_OrderItem.m
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLCell_OrderItem.h"

//#import "XLView_OrderHeader.h"
//#import "XLView_OrderFooter.h"
//#import "XLView_OrderContent.h"

//@interface XLCell_OrderItem()
//{
//    XLView_OrderHeader *_headerView;
//    XLView_OrderContent *_contentView;
//    XLView_OrderFooter *_footerView;
//}
//@end

@implementation XLCell_OrderItem

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        [self createControls];
//    }
//    return self;
//}
///**
// *  创建控件
// */
//- (void)createControls
//{
//    _headerView = [[XLView_OrderHeader alloc] init];
//    [self.contentView addSubview:_headerView];
//    
//    _contentView = [[XLView_OrderContent alloc] init];
//    [self.contentView addSubview:_contentView];
//    
//    _footerView = [[XLView_OrderFooter alloc] init];
//    [self.contentView addSubview:_footerView];
//    
//    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.mas_equalTo(0);
//    }];
//    
//    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(_headerView.mas_bottom).mas_offset(0);
//    }];
//    
//    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.top.mas_equalTo(_contentView.mas_bottom).mas_offset(0);
//    }];
//    
//}


@end
