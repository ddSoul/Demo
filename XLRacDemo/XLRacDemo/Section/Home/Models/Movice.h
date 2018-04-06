//
//  Movice.h
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Avatars.h"

@interface Images : NSObject

@property (nonatomic, copy) NSString *small;

@end

//@interface Directors : NSObject
//
/////**
//// * 头像链接
//// */
//@property (nonatomic, strong) Avatars *avatars;
//
//@end

@interface Movice : NSObject

/**
 * 电影链接
 */
@property (nonatomic, copy) NSString *alt;

/**
 * 英文民
 */
@property (nonatomic, copy) NSString *name_en;

/**
 * 中文名
 */
@property (nonatomic, copy) NSString *name;



@property (nonatomic, strong) Images *images;


@end



