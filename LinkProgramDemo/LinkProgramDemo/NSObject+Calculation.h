//
//  NSObject+Calculation.h
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CalculationMaker.h"
@interface NSObject(Calculation)

+ (CGFloat)makeCalculators:(void(^)(CalculationMaker * maker))calculationBlock;


@end
