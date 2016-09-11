//
//  HomeViewModel.m
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "HomeViewModel.h"
#import "AFNetworking.h"
#import "MJExtension.h"

@interface HomeViewModel()
/**数据源*/
@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation HomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    
        @weakify(self);
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       
        @strongify(self);
        RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            //发送网络请求
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            
            [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"iOS开发"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                // 请求成功的时候调用
                NSArray *dictArr = responseObject[@"books"];
                NSArray * modelArray = [[dictArr.rac_sequence map:^id(id value) {
                    return [BookModel mj_objectWithKeyValues:value];
                }] array];
                //发出信号
                [self.dataArray addObjectsFromArray:modelArray];
                
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
            return nil;
        }];
        return signal;
    }];
}

- (NSArray <BookModel *>*)getListData{
    return self.dataArray;
}

#pragma mark ---getter/setter---
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
