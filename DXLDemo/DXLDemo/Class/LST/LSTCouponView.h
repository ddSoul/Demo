//
//  LSTCouponView.h
//  DXLDemo
//
//  Created by ddSoul on 2018/4/11.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTCouponView : UIView

- (instancetype)initWithFrame:(CGRect)frame withCoupons:(id)coupons;
//弹出
-(void)show;

//隐藏
-(void)hide;


@end
