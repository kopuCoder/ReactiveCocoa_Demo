//
//  NSObject+Calculation.m
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "NSObject+Calculation.h"

@implementation NSObject(Calculation)

+ (CGFloat)makeCalculators:(void(^)(CalculationMaker * maker))calculationBlock{
    CalculationMaker * tempMaker = [[CalculationMaker alloc] init];
    calculationBlock(tempMaker);
    return tempMaker.total;
}

@end
