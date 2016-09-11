//
//  Calculator.m
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (Calculator *)calculator:(CGFloat (^)(CGFloat argv))calculation{
    self.total = calculation(self.total);
    return self;
}

- (Calculator *)equeal:(BOOL(^)(CGFloat argv))operation{
    BOOL isEqueal = operation(self.total);
    NSString * result = (isEqueal ==YES)?@"相等":@"不相等";
    NSLog(@"result:%@",result);
    return self;
}
@end
