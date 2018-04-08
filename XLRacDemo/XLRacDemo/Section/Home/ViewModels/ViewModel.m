//
//  ViewModel.m
//  XLRacDemo
//
//  Created by ddSoul on 2018/3/30.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewModel.h"
#import "Movice.h"
#import "Cell_BaseItem.h"

@interface ViewModel()
@property (nonatomic, strong) RACCommand *command;
@end

@implementation ViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initViewModel];
    }
    return self;
}


/**
 初始化命令
 */
- (void)initViewModel {
    @weakify(self);
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self);
            [self getDoubanList:^(NSArray <Movice *>*viewModels) {
                [subscriber sendNext:viewModels];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];

}

- (void)getDoubanList:(void(^)(NSArray<Movice*> *viewModels))succeedBlock {
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        NSLog(@"________%@",responseObject);
//        NSArray *movices = [Movice mj_objectArrayWithKeyValuesArray:responseObject[@"subjects"]];
//        NSMutableArray *viewModels = @[].mutableCopy;
//        for (Movice *movice in movices) {
//            [viewModels addObject:[self initWithMovice:movice]];
//        }
//        succeedBlock(viewModels);
//    } failure:nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"db" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSArray *responseObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *movices = [Movice mj_objectArrayWithKeyValuesArray:responseObject];
    NSMutableArray *viewModels = @[].mutableCopy;
    for (Movice *movice in movices) {
        [viewModels addObject:[self initWithMovice:movice]];
    }
    succeedBlock(viewModels);
}

- (instancetype)initWithMovice:(Movice *)movice {
    ViewModel *viewModel = [ViewModel new];
    viewModel.alt = movice.alt;
    viewModel.sAvatar = movice.images.small;
    if ([movice.type isEqualToString:@"cellImage"]) {
        viewModel.cellReuseIdentifier = kImageCellReuseIdentifier;
    }else {
        viewModel.cellReuseIdentifier = kTitleCellReuseIdentifier;
    }
    return viewModel;
}

@end
