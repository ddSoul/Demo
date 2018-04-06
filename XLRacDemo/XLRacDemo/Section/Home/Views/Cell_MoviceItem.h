//
//  Cell_MoviceItem.h
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell_MoviceItem : UITableViewCell

+ (NSString *)cellReuseIdentifier;

@property (nonatomic, strong) id model;

@end
