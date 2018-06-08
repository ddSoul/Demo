//
//  HeightCacheTool.h
//  XLListViewDemo
//
//  Created by ddSoul on 2018/4/26.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section :NSObject
/* 业务标题*/
@property (nonatomic, copy) NSString *ywTitle;
/* 业务描述*/
@property (nonatomic, copy) NSString *ywContent;
/* 业务logo*/
@property (nonatomic, copy) NSString *ywLogo;
/* cell高度*/
@property (nonatomic, assign) CGFloat height;

@end



@interface CellModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, copy) NSArray <Section *>*sectionList;

@end

@interface CellData : NSObject

- (NSArray <CellModel *>*)loadData;

@end
