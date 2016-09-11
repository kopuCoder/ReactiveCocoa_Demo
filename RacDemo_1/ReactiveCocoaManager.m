//
//  ReactiveCocoaManager.m
//  RacDemo_1
//
//  Created by kopuCoder on 16/8/28.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ReactiveCocoaManager.h"

@interface ReactiveCocoaManager()

//计算总和
@property (nonatomic,assign)CGFloat total;

@end

@implementation ReactiveCocoaManager

- (instancetype)calculation:(NSInteger(^)(NSInteger argv))calculationBlock{
    _total = calculationBlock(_total);
    if(_total == 10){
        NSLog(@"恭喜你，计算正确。。。正确答案为：10");
    }
    return self;
}

- (instancetype)descAction:(NSInteger(^)(NSInteger argv))descBlock{
    _total = descBlock(_total);
    NSLog(@"减之后的结果为：%g",_total);
    return self;
}

- (NSInteger)result{
    return _total;
}

@end
