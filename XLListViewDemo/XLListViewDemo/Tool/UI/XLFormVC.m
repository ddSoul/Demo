//
//  XLFormVC.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/5/9.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLFormVC.h"
#import "FormTCell.h"
#import "ViewModel.h"

@interface XLFormVC ()

@end

@implementation XLFormVC

//@synthesize rowDescriptor = _rowDescriptor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    XLFormDescriptor *formDescriptor = [XLFormDescriptor formDescriptorWithTitle:@"选择办理方式"];
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    section = [XLFormSectionDescriptor formSection];
    [formDescriptor addFormSection:section];
    
    
    
    /** 20180509 Begin*/
    section = [XLFormSectionDescriptor formSection];
    [formDescriptor addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"20180509" rowType:XLFormRowDescriptorTypeSelectorFDActionSheet title:@"支付方式"];
    row.value = @"在线支付";
    
    [row.cellConfig setObject:@"ddddd" forKey:@"titleLabel.text"];
    __weak typeof(self) weakSelf = self;
    row.action.formBlock = ^(XLFormRowDescriptor * _Nonnull sender) {
        NSLog(@"__block");
        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf loadQ];
            [sender.cellConfig setObject:@"2222" forKey:@"titleLabel.text"];
            [self.tableView reloadData];
        });
//        sender.displayText = @"dddd";
    };
    [section addFormRow:row];
    
    self.form = formDescriptor;
    
//    UITapGestureRecognizer *gse = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadQ)];
//    gse.state = ss;
    
    
//    [self loadQ];
    
    
    ViewModel *m1 = [ViewModel new];
    m1.alt = @"123";
    
    ViewModel *m2 = [ViewModel new];
    m2.alt = @"456";
    
    NSString *s1 = @"1";
    NSString *s2 = @"2";
    NSArray *a1 = @[@"1",s2];
    
    
    ViewModel *m3 = [ViewModel new];
    m1.alt = @"123";
    
    ViewModel *m4 = [ViewModel new];
    m2.alt = @"456";
    
    NSString *s3 = @"1";
    NSString *s4 = @"2";
    NSArray *a2 = @[s3,s4];
    
    
    NSLog(@"_____s1:%p____s3:%p",s1,s3);
    
    
//    if ([a2 containsObject:m1]) {
        NSInteger index = [a2 indexOfObject:@"1"];
        NSLog(@"-1---%ld---",index);
//    }
    
    

    /** 20180509 End*/
    // Do any additional setup after loading the view.
}
- (void)loadQ {
    XLFormRowDescriptor *tRow = [self.form formRowWithTag:@"20180509"];
    [tRow.cellConfig setObject:@"11" forKey:@"titleLabel.text"];
    [self.tableView reloadData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"______touch");
    XLFormRowDescriptor *r = [self.form formRowWithTag:@"20180509"];
    [r.cellConfig setObject:@"xxxx" forKey:@"titleLabel.text"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
