//
//  Cell_TitlesItem.m
//  XLRacDemo
//
//  Created by ddSoul on 2018/4/8.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "Cell_TitlesItem.h"
#import "ViewModel.h"

@interface Cell_TitlesItem()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation Cell_TitlesItem

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
    if (self)
    {
        [self createControls];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)createControls {
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.bottom.mas_equalTo(-10);
    }];
    
}

#pragma mark - public Metheds
+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self.class);
}

#pragma mark - setter、getter
- (void)setModel:(id)model {
    ViewModel *viewModel = (ViewModel *)model;
    self.titleLabel.text = viewModel.alt;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:30];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor redColor];
    }
    return _titleLabel;
}

@end
