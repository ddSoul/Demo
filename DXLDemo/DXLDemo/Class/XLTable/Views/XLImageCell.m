//
//  XLImageCell.m
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLImageCell.h"
#import "XLTableViewItem.h"
#import "Model.h"

@implementation XLImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setter,getter
- (void)setItem:(XLTableViewItem *)item {
    Model *model = (Model *)item.model;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_green"]];
    NSLog(@"_____________imageCell:%@",model.title);
}

@end
