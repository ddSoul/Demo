//
//  ViewController.m
//  GBChartDemo
//
//  Created by midas on 2018/12/10.
//  Copyright © 2018 Midas. All rights reserved.
//

#import "ViewController.h"
#import "GBChart/GBChart.h"

@interface ViewController () {
    GBRadarChart *_radarChart; //雷达图
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self radarChart];
}

- (void)radarChart {
    
    NSMutableArray *items = [NSMutableArray array];
    NSArray *values = @[@100,@80,@10,@70,@45,];
    NSArray *descs = @[@"动手能力",@"想象力",@"创造力",@"积极性",@"其他"];
    for (int i = 0; i < values.count; i++) {
        
        GBRadarChartDataItem *item = [GBRadarChartDataItem dataItemWithValue:[values[i] floatValue] description:descs[i]];
        [items addObject:item];
    }

    GBRadarChart *radarChart = [[GBRadarChart alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 400) items:items valueDivider:25];
    radarChart.isShowGraduation = YES;
    radarChart.labelStyle = GBRadarChartLabelStyleCircle;
    [radarChart strokeChart];
    [self.view addSubview:radarChart];
    _radarChart = radarChart;
}

@end
