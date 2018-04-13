//
//  Cell_BannerItem.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/4/13.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "Cell_BannerItem.h"
#import "ViewModel.h"
#import "XLCycleCollectionView.h"

@implementation Cell_BannerItem

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
    
    self.backgroundColor = [UIColor purpleColor];
//    XLCycleCollectionView *cyleView = [[XLCycleCollectionView alloc] init];
//    cyleView.data = @[@"Hello",@"world",@"!"];
//    [self.contentView addSubview:cyleView];
//
//    [cyleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.right.mas_equalTo(0);
//        make.height.mas_equalTo(200);
//    }];
}

- (void)setModel:(id)model {
    //    NSLog(@"________smlAva:%@",viewModel.sAvatar);
}

@end
