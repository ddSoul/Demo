//
//  ViewController_Home.m
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController_Home.h"
#import "ViewModel.h"
#import "Movice.h"
#import "Cell_MoviceItem.h"

@interface ViewController_Home ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ViewModel *viewModel;
@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController_Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化UI
    [self initStyle];
    //绑定ViewModel
    [self bindViewModel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private Metheds
- (void)initStyle {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.listView];
}
- (void)bindViewModel {
    @weakify(self);
    //将命令执行后的数据交给controller
    [self.viewModel.command.executionSignals.switchToLatest subscribeNext:^(NSArray<Movice *> *movices) {
        @strongify(self);
        [SVProgressHUD showSuccessWithStatus:@"加载成功"];
        self.items = movices;
        [self.listView reloadData];
        [SVProgressHUD dismissWithDelay:1.5];
    }];
    
    //执行command
    [self.viewModel.command execute:nil];
    [SVProgressHUD showWithStatus:@"加载中..."];
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell_MoviceItem *cell = [tableView dequeueReusableCellWithIdentifier:[Cell_MoviceItem cellReuseIdentifier] forIndexPath:indexPath];
    cell.model = self.items[indexPath.row];
    return cell;
}

#pragma mark - setter、getter
- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] init];
        _listView.frame = self.view.bounds;
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.estimatedRowHeight = 100;
        
        [_listView registerClass:[Cell_MoviceItem class] forCellReuseIdentifier:[Cell_MoviceItem cellReuseIdentifier]];
    }
    return _listView;
}
- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ViewModel alloc] init];
    }
    return _viewModel;
}

@end
