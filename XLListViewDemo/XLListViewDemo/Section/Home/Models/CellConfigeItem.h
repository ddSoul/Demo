//
//  CellConfigeItem.h
//  XLListViewDemo
//
//  Created by ddSoul on 2018/4/13.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellConfigeItem : NSObject

/** 注册复用Cell类名*/
@property (nonatomic, strong) Class cellClass;
/** 复用标识*/
@property (nonatomic, copy) NSString *reuseIdentifier;

@end
