//
//  Cell_MoviceItem.m
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "Cell_MoviceItem.h"
#import "ViewModel.h"

@interface Cell_MoviceItem()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation Cell_MoviceItem

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
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
    
    @weakify(self);
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(10);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(100);
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
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.sAvatar]];
//    NSLog(@"________smlAva:%@",viewModel.sAvatar);
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor grayColor];
    }
    return _titleLabel;
}
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.backgroundColor = [UIColor redColor];
    }
    return _avatarImageView;
}



@end
