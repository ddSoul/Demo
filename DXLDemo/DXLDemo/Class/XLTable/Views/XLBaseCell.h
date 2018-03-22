//
//  XLBaseCell.h
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * CellReuseIdentifier
 * 可根据自己的需求去扩展
 */
static NSString *kImageCellReuseIdentifier = @"imageCellReuseIdentifier";
static NSString *kTitleCellReuseIdentifier = @"titleCellReuseIdentifier";

@class XLTableViewItem;

@interface XLBaseCell : UITableViewCell

@property (nonatomic, strong) XLTableViewItem *item;
@property (nonatomic, copy) void(^TouchEventHandler)(id arg);

@end
