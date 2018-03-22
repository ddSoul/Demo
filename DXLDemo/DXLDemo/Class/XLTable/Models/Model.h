//
//  Model.h
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
/**
 * 项目中的数据模型，例如User
 * Model返回的字段，可能是UserName或者NickName等...
 */
@property (nonatomic, copy) NSString *title;

@end
