//
//  Cell_BaseItem.h
//  XLRacDemo
//
//  Created by ddSoul on 2018/4/8.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * CellReuseIdentifier
 * 可根据自己的需求去扩展
 */
static NSString *kImageCellReuseIdentifier = @"imageCellReuseIdentifier";
static NSString *kTitleCellReuseIdentifier = @"titleCellReuseIdentifier";

@interface Cell_BaseItem : UITableViewCell

+ (NSString *)cellReuseIdentifier;

@property (nonatomic, strong) id model;

@end
