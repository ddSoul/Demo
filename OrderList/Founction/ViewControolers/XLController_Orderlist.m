//
//  XLController_Orderlist.m
//  OrderList
//
//  Created by ddSoul on 2017/12/18.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "XLController_Orderlist.h"
#import "XLCell_OrderItem.h"

@interface XLController_Orderlist ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *orderListView;

@end

@implementation XLController_Orderlist

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    // Do any additional setup after loading the view.
}
- (void)setUpViews {
    self.title = @"订单";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.orderListView];
    
    [self.orderListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - public methods
#pragma mark - private methods
#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLCell_OrderItem *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - selector
#pragma mark - getters and setters
- (UITableView *)orderListView {
    if (!_orderListView) {
        _orderListView = [[UITableView alloc] init];
        _orderListView.delegate = self;
        _orderListView.dataSource = self;
        
        [_orderListView registerClass:[XLCell_OrderItem class] forCellReuseIdentifier:@"cell"];
    }
    return _orderListView;
}

@end
