//
//  ViewController.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/4/13.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "VolvoProfessionCell.h"
#import "HeightCacheTool.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray <CellModel *>*items;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initStyle];
//    [self loadData];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"icon_listnew"];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.top.mas_equalTo(200);
        make.left.mas_equalTo(50);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)loadData {
    self.items = [[CellData alloc] loadData];
    [self.listView reloadData];
}

- (void)initStyle {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.listView.frame = self.view.bounds;
    [self.view addSubview:self.listView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    for (int i = 0; i<self.items.count; i++) {
        if (section == i) {
            return self.items[i].sectionList.count;
        }
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//    for (int i = 0; i<self.items.count; i++) {
//        if (section == i) {
//            return self.items[i].sectionList.count;
//        }
//    }
    if (indexPath.section == 0) {
        return 50;
    }else {
        if (indexPath.row == 0) {
            return self.items[1].sectionList[0].height;
        }
        return 150;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VolvoProfessionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] init];
        _listView.frame = self.view.bounds;
        _listView.delegate = self;
        _listView.dataSource = self;
        /** 注册Cell */
        [_listView registerClass:[VolvoProfessionCell class] forCellReuseIdentifier:@"cell"];
    }
    return _listView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
