//
//  LSTCouponView.m
//  DXLDemo
//
//  Created by ddSoul on 2018/4/11.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "LSTCouponView.h"

#define TagValue  1000
#define AlertTime 0.3 //弹出动画时间
#define DropTime 0.5 //落下动画时间

#define XL_ScreenW [UIScreen mainScreen].bounds.size.width
#define XL_ScreenH [UIScreen mainScreen].bounds.size.height

static const CGFloat Padding_left = 30.f;

@interface LSTCouponView()

@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSMutableArray *selects;

@end

@implementation LSTCouponView

- (instancetype)initWithFrame:(CGRect)frame withCoupons:(id)coupons {
    if (self = [super initWithFrame:frame]) {
        [self customUIwithCoupons:coupons];
    }
    return self;
}

/**
 * 弹出隐藏
 */
- (void)show {
    if (self.superview) {
        [self removeFromSuperview];
    }
    /* 是否已经存在，存在remove*/
    UIView *exitView = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (exitView) {
        [exitView removeFromSuperview];
    }
    /* 蒙层*/
    UIView *maskView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    maskView.tag = TagValue;
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [[UIApplication sharedApplication].keyWindow addSubview:maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.center = [UIApplication sharedApplication].keyWindow.center;
    self.alpha = 0;

    [UIView animateWithDuration:AlertTime animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
        self.alertView.frame = CGRectMake(0, XL_ScreenH-200, XL_ScreenW, 200);
    }];
}
- (void)hide {
    if (self.superview) {
        [UIView animateWithDuration:AlertTime animations:^{
            self.alertView.frame = CGRectMake(0, XL_ScreenH, XL_ScreenW, 50 * 4);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            UIView *maskView = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
            if (maskView) {
                [maskView removeFromSuperview];
            }
            [self removeFromSuperview];
        }];
    }
}


#pragma mark - private Metheds
- (void)customUIwithCoupons:(id)coupons {
//    NSArray *arrays = @[@"1",@"2",@"3",@"4"];
    
    self.alertView.frame = CGRectMake(0, XL_ScreenH, XL_ScreenW, 50 * 4);
    for (int i = 0; i < 4; i++) {
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, XL_ScreenW, 50)];
        if (0 == i) {
            [tempView addSubview:[self availableViewWithCoupon:nil]];
        }else if (1 == i) {
            [tempView  addSubview:[self disAvailableViewWithCoupon:nil]];
        }else if (2 == i) {
            [tempView  addSubview:[self useAbleViewWithCoupon:nil]];
        }else if (3 == i) {
            [tempView  addSubview:[self closeViewButton]];
        }
        [self.alertView addSubview:tempView];
    }
    
    [self addSubview:self.alertView];
    
}

#pragma makr - touch Event
- (void)tapGes:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
    UIView *views = (UIView*) tap.view;
    NSUInteger tag = views.tag;
    NSLog(@"-----tag-------------%lu",(unsigned long)tag);
}

#pragma mark - UI
/* 可用Item*/
- (UIView *)availableViewWithCoupon:(id)coupod {
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    UIView *avaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XL_ScreenW, 50)];
    avaView.backgroundColor = [UIColor whiteColor];
    avaView.userInteractionEnabled = YES;
    [avaView addGestureRecognizer:tapGes];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(Padding_left, 10, 200, 30);
    content.text = @"300元 定向又回去拿卧槽";
    content.font = [UIFont systemFontOfSize:14];
    [avaView addSubview:content];
    
    UIImageView *selectImageView = [[UIImageView alloc] init];
    selectImageView.frame = CGRectMake(XL_ScreenW-50, 10, 30, 30);
    selectImageView.backgroundColor = [UIColor grayColor];
    [avaView addSubview:selectImageView];
    
    return avaView;
}

/* 不可用Item*/
- (UIView *)disAvailableViewWithCoupon:(id)coupod {
    
    UIView *avaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XL_ScreenW, 50)];
    avaView.backgroundColor = [UIColor whiteColor];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(Padding_left, 5, 200, 20);
    content.text = @"50元 定向又回去拿卧槽";
    content.font = [UIFont systemFontOfSize:14];
    [avaView addSubview:content];
    
    UILabel *reason = [[UILabel alloc] init];
    reason.frame = CGRectMake(Padding_left, 30, 200, 15);
    reason.text = @"lalalaalallaallalalal";
    reason.font = [UIFont systemFontOfSize:12];
    [avaView addSubview:reason];
    
    UIImageView *selectImageView = [[UIImageView alloc] init];
    selectImageView.frame = CGRectMake(XL_ScreenW-50, 10, 40, 50);
    selectImageView.backgroundColor = [UIColor redColor];
    [avaView addSubview:selectImageView];
    
    return avaView;
    
}
/* 不用Item*/
- (UIView *)useAbleViewWithCoupon:(id)coupod {
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    UIView *avaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XL_ScreenW, 50)];
    avaView.backgroundColor = [UIColor whiteColor];
    avaView.userInteractionEnabled = YES;
    [avaView addGestureRecognizer:tapGes];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(Padding_left, 10, 200, 30);
    content.text = @"不用任性";
    content.font = [UIFont systemFontOfSize:14];
    [avaView addSubview:content];
    
    UIImageView *selectImageView = [[UIImageView alloc] init];
    selectImageView.frame = CGRectMake(XL_ScreenW-50, 10, 30, 30);
    selectImageView.backgroundColor = [UIColor grayColor];
    [avaView addSubview:selectImageView];
    
    return avaView;
    
}

- (UIButton *)closeViewButton {
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(0, 0, XL_ScreenW, 50);
    close.backgroundColor = [UIColor greenColor];
    [close setTitle:@"关闭" forState:UIControlStateNormal];
    [close addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    return close;
}

- (UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor whiteColor];
    }
    return _alertView;
}
- (UIView *)lineView {
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor blueColor];

    return _lineView;
}
- (NSMutableArray *)selects {
    if (!_selects) {
        _selects = @[].mutableCopy;
    }
    return _selects;
}
//- (UILabel *)title {
//    _title = [[UILabel alloc] init];
//    return _title;
//}

@end
