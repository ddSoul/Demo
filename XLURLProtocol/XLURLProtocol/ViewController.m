//
//  ViewController.m
//  XLURLProtocol
//
//  Created by ddSoul on 2018/3/26.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "XLHTTPProtocol.h"
#import "XLNetWorkTool.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, strong) UILabel *contentLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBar];
    [self.view addSubview:self.contentLabel];
    [[XLNetWorkTool shareInstance] showUrls:@[@"https://www.baidu.com",@"https://www.jianshu.com"]];

//    [NSURLProtocol unregisterClass:[XLHTTPProtocol class]];
    
}
- (void)setNavgationBar {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.reloadButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)reloadRequest {
    //刷新
    // 1.创建一个网络路径
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.b11dddddu.com"]];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        dispatch_async(dispatch_get_main_queue(), ^{
            self.contentLabel.text = [response.URL absoluteString];
        });
    }];
    // 5.最后一步，执行任务（resume也是继续执行）:
    [sessionDataTask resume];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)reloadButton {
    if (!_reloadButton) {
        _reloadButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 21.5)];
        [_reloadButton setTitle:NSLocalizedString(@"reload", nil) forState:UIControlStateNormal];
        [_reloadButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_reloadButton addTarget:self action:@selector(reloadRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadButton;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = self.view.bounds;
        _contentLabel.backgroundColor = [UIColor greenColor];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}


@end
