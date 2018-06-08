//
//  HeightCacheTool.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/4/26.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "HeightCacheTool.h"
//Section

@implementation Section

@end


@implementation CellModel

@end


@implementation CellData

- (NSArray <CellModel *>*)loadData {
  
    CellModel *model1 = [[CellModel alloc] init];
    
    Section *section1 = [[Section alloc] init];
    section1.ywTitle = @"123";
    section1.ywContent = @"女大当嫁看到的就爱看你点击安达街and假按揭";
    section1.height = 50;
    
    model1.sectionTitle = @"新办";
    model1.sectionList = @[section1];
    
    
    CellModel *model2 = [[CellModel alloc] init];
    
    Section *section21 = [[Section alloc] init];
    section21.ywTitle = @"2222";
    section21.ywContent = @"da街and假按da街and假按女大dadadaadda街and假按da街and假按da街and假按da街and假按安达街and假按揭";
    section21.height = [self getHeightLineWithString:section21.ywContent];
    
    Section *section22 = [[Section alloc] init];
    section22.ywTitle = @"dadadada";
    section22.ywContent = @"aass";
    section22.height = 150;
    
    
    model2.sectionTitle = @"特殊业务";
    model2.sectionList = @[section21,section22];
    
    return @[model1,model2];
    
}

#pragma mark - 根据字符串计算label高度
- (CGFloat)getHeightLineWithString:(NSString *)string {
    
    //1.1最大允许绘制的文本范围
    CGSize size = CGSizeMake(300, 2000);
    //1.2配置计算时的行截取方法,和contentLabel对应
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:10];
    //1.3配置计算时的字体的大小
    //1.4配置属性字典
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:style};
    //2.计算
    //如果想保留多个枚举值,则枚举值中间加按位或|即可,并不是所有的枚举类型都可以按位或,只有枚举值的赋值中有左移运算符时才可以
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
    
    return height;
}

@end
