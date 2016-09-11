//
//  CalculationMaker.m
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "CalculationMaker.h"

@implementation CalculationMaker

- (CalculationMaker *(^)(CGFloat argv))add{
    
    return ^CalculationMaker *(CGFloat addArgv){
        
        self.total+=addArgv;
        return self;
    };
}
- (CalculationMaker *(^)(CGFloat argv))sub{
    
    return ^CalculationMaker *(CGFloat subArgv){
        self.total-=subArgv;
        return self;
    };
}

@end
