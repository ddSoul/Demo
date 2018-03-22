//
//  XLTableViewController.m
//  DXLDemo
//
//  Created by ddSoul on 2018/3/22.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLTableViewController.h"

#import "XLBaseCell.h"
#import "XLImageCell.h"
#import "XLTitleCell.h"

#import "XLTableViewItem.h"
#import "Model.h"

@interface XLTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray <XLTableViewItem *>*items;

@end

@implementation XLTableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    // Do any additional setup after loading the view.
}
- (void)setUpViews {
    self.title = @"XLTabel";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listView.frame = self.view.bounds;
    [self.view addSubview:self.listView];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - public methods
#pragma mark - private methods
- (void)loadData {
    Model *model1 = [Model new];
    model1.title = @"O-bject";
    
    Model *model2 = [Model new];
    model2.title = @"Java";
    
    Model *model3 = [Model new];
    model3.title = @".Net";
    
    self.items = @[
                   [XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model1 cellType:XLCellTypeTitle],
                   [XLTableViewItem initItemWithCellReuseIdentifier:kImageCellReuseIdentifier model:model2 cellType:XLCellTypeImage],
                   [XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model3 cellType:XLCellTypeTitle],
                   [XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model1 cellType:XLCellTypeTitle],
                   [XLTableViewItem initItemWithCellReuseIdentifier:kImageCellReuseIdentifier model:model2 cellType:XLCellTypeImage],
                   [XLTableViewItem initItemWithCellReuseIdentifier:kTitleCellReuseIdentifier model:model3 cellType:XLCellTypeTitle]
                   ];
    
    [self.listView reloadData];
    
}
#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLTableViewItem *item = self.items[indexPath.row];
    XLBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellReuseIdentifier forIndexPath:indexPath];
    cell.item = item;
    return cell;
}
#pragma mark - selector
#pragma mark - getters and setters
#pragma mark - getters and setters
- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] init];
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_listView registerClass:[XLImageCell class] forCellReuseIdentifier:kImageCellReuseIdentifier];
        [_listView registerClass:[XLTitleCell class] forCellReuseIdentifier:kTitleCellReuseIdentifier];
    }
    return _listView;
}

@end
