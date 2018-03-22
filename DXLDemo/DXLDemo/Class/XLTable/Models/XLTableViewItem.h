//
//  XLTableViewItem.h
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * cell类型
 - XLCellTypeTitle: 文字类型
 - LCellTypeImage: 图片类型
 */
typedef NS_ENUM(NSInteger, XLCellType) {
    XLCellTypeTitle = 0,
    XLCellTypeImage
};

@interface XLTableViewItem : NSObject

/**
 * 可根据自己的需求去扩展
 */
@property (nonatomic, copy) NSString *cellReuseIdentifier;
@property (nonatomic, strong) id model;
@property (nonatomic, assign) XLCellType type;


/**
 * 配置CellItem
 * @param cellReuseIdentifiers cell重用标识
 * @param model 数据源
 * @param type cell类型
 * @return Item
 */
+ (instancetype)initItemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                          model:(id)model
                                       cellType:(NSInteger)type;

@end
