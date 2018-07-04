//
//  XLNetWorkTool.m
//  XLURLProtocol
//
//  Created by ddSoul on 2018/3/28.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLNetWorkTool.h"
#import <UIKit/UIKit.h>

@interface XLNetWorkTool ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  UITableView *tableView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSArray *urls;

@end

static XLNetWorkTool *_instance;

@implementation XLNetWorkTool

/**
 *  创建实例
 */
+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil)
            _instance = [[XLNetWorkTool alloc] init];
    });
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark - pubilc Metheds
- (void)showUrls:(NSArray *)urls {
    self.urls = urls;
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGR:)];
    [self.button addGestureRecognizer:panGR];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.button];
}

#pragma mark - pravite Metheds
- (void)panGR: (UIPanGestureRecognizer *)rec{
    
    CGPoint point = [rec translationInView:[UIApplication sharedApplication].keyWindow];
    NSLog(@"%f,%f",point.x,point.y);
    rec.view.center = CGPointMake(rec.view.center.x + point.x, rec.view.center.y + point.y);
    [rec setTranslation:CGPointMake(0, 0) inView:[UIApplication sharedApplication].keyWindow];

}

- (void)click {
    
    UIView *tView = [[UIApplication sharedApplication].keyWindow viewWithTag:101];
    if (tView) {
        [self.button setTitle:@"Open" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.2f animations:^{
            self.tableView.frame = self.button.frame;
        } completion:^(BOOL finished) {
            [tView removeFromSuperview];
        }];
    }else {
        [[UIApplication sharedApplication].keyWindow addSubview:self.tableView];
        [self.button setTitle:@"Close" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.2f animations:^{
            self.tableView.frame = [UIApplication sharedApplication].keyWindow.frame;
            [self.tableView reloadData];
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication].keyWindow insertSubview:self.button aboveSubview:self.tableView];
        }];
    }
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urls.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = self.urls[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
     NSString *selUrl = [[NSUserDefaults standardUserDefaults] valueForKey:@"url"];
    if (selUrl) {
        if ([self.urls[indexPath.row] isEqualToString:selUrl]) {
            cell.backgroundColor = [UIColor orangeColor];
        }
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"_____________url:%@",self.urls[indexPath.row]);
    [[NSUserDefaults standardUserDefaults] setValue:self.urls[indexPath.row] forKey:@"url"];
    
    NSString *alertMessage = [NSString stringWithFormat:@"环境切换至:%@",self.urls[indexPath.row]];

    [self click];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.center = [UIApplication sharedApplication].keyWindow.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tag = 101;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 64, 64, 64);
        _button.backgroundColor = [UIColor blackColor];
        _button.alpha = 0.8;
        _button.tag = 102;
        _button.layer.cornerRadius = 32;
        [_button setTitle:@"Open" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        self.tableView.frame = _button.frame;
    }
    return _button;
}

@end
