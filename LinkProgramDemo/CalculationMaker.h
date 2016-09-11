//
//  CalculationMaker.h
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/***  计算器*/
@interface CalculationMaker : NSObject

/**总和*/
@property (nonatomic,assign)CGFloat total;
- (CalculationMaker *(^)(CGFloat argv))add;
- (CalculationMaker *(^)(CGFloat argv))sub;

@end
