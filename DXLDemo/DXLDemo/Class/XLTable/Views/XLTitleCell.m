//
//  XLTitleCell.m
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLTitleCell.h"
#import "XLTableViewItem.h"
#import "Model.h"

@implementation XLTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createControls];
    }
    return self;
}
- (void)createControls {
    self.textLabel.textColor = [UIColor redColor];
    self.textLabel.backgroundColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - setter,getter
- (void)setItem:(XLTableViewItem *)item {
    Model *model = (Model *)item.model;
    self.textLabel.text = model.title;
}


@end
