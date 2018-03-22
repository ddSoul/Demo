//
//  XLTableViewItem.m
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLTableViewItem.h"

@implementation XLTableViewItem

+ (instancetype)initItemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                          model:(id)model
                                       cellType:(NSInteger)type {
    XLTableViewItem *item = [[[self class] alloc] init];
    item.model = model;
    item.type = type;
    item.cellReuseIdentifier = cellReuseIdentifiers;
    
    return item;
}

@end
