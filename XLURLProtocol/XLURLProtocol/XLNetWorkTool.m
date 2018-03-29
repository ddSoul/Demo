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
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.button];
}

#pragma mark - pravite Metheds

- (void)click {
    
    UIView *tView = [[UIApplication sharedApplication].keyWindow viewWithTag:101];
    if (tView) {
        [self.button setTitle:@"open" forState:UIControlStateNormal];
        [tView removeFromSuperview];
    }else {
        [self.button setTitle:@"close" forState:UIControlStateNormal];
        [[UIApplication sharedApplication].keyWindow addSubview:self.tableView];
    }
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urls.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor grayColor];
    cell.textLabel.text = self.urls[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"_____________url:%@",self.urls[indexPath.row]);
    [[NSUserDefaults standardUserDefaults] setValue:self.urls[indexPath.row] forKey:@"url"];
    UIView *tView = [[UIApplication sharedApplication].keyWindow viewWithTag:101];
    [self.button setTitle:@"open" forState:UIControlStateNormal];
    [tView removeFromSuperview];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 100, 300, 200);
        _tableView.center = [UIApplication sharedApplication].keyWindow.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tag = 101;
        _tableView.backgroundColor = [UIColor grayColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, 64, 64);
        _button.alpha = 0.5;
        _button.backgroundColor = [UIColor orangeColor];
        _button.tag = 102;
        [_button setTitle:@"open" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}



@end
