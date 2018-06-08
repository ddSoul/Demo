//
//  XLDrawerViewController.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/5/21.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "XLDrawerViewController.h"
#import "PerViewController.h"

@interface XLDrawerViewController ()

@property (nonatomic, strong) PerViewController *per;


@end

@implementation XLDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
//    [self addChildViewController:self.per];
//    [self.view addSubview:self.per.view];
    
    [self presentViewController:self.per animated:YES completion:^{
        
    }];
    
    [UIView animateWithDuration:0.15 animations:^{

        self.per.view.transform = CGAffineTransformMakeTranslation(250, 0);
 
    }completion:^(BOOL finished) {

        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PerViewController *)per {
    if (!_per) {
        _per = [[PerViewController alloc] init];
    }
    return _per;
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
